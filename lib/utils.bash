#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/sagiegurari/cargo-make"
TOOL_NAME="cargo-make"

# NOTE: Both --help, --version options exist. Prefix should be `makers` or `cargo-make make`. However `makers` does not exist in older versions.
TOOL_TEST="cargo-make make --version"

# We would check after released 1.0.0+
supporting_cargomake_version_pattern='^([1-9][0-9]{0,}|0)\.([2-9][0-9]|1[6-9])\.[0-9]{1,}$'

filter_supporting_cargomake_versions() {
	grep -E "$supporting_cargomake_version_pattern"
}

is_supporting_cargomake_version() {
	echo "$ASDF_INSTALL_VERSION" | grep -qE "$supporting_cargomake_version_pattern"
}

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	list_github_tags
}

list_all_supporting_versions() {
	list_all_versions | filter_supporting_cargomake_versions
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	local platform

	case "$OSTYPE" in
	darwin*) platform="apple-darwin" ;;
	linux*) platform="unknown-linux-musl" ;;
	*) fail "Unsupported platform" ;;
	esac

	local architecture

	case "$(uname -m)" in
	x86_64*) architecture="x86_64" ;;
	# They are releasing aarch64 binary since 0.36.7: https://github.com/sagiegurari/cargo-make/commit/ab3cac2261c0ba67ab6d7a277aff8252faec0b1c
	aarch64 | arm64) architecture="aarch64" ;;
	*) fail "Unsupported architecture" ;;
	esac

	local archive_format="zip"

	# They use this naming since 0.15.1, currently do not work for the ancient versions
	# https://github.com/sagiegurari/cargo-make/releases/tag/0.15.1 - 2018-11-13
	# https://github.com/sagiegurari/cargo-make/releases/tag/0.15.0 - 2018-11-13
	# Snapshot of the addressies are below
	# https://github.com/sagiegurari/cargo-make/releases/download/0.36.2/cargo-make-v0.36.2-x86_64-unknown-linux-musl.zip
	# https://github.com/sagiegurari/cargo-make/releases/download/0.36.2/cargo-make-v0.36.2-x86_64-apple-darwin.zip
	# https://github.com/sagiegurari/cargo-make/releases/download/0.36.2/cargo-make-v0.36.2-x86_64-pc-windows-msvc.zip
	local url="$GH_REPO/releases/download/${version}/cargo-make-v${version}-${architecture}-${platform}.${archive_format}"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"

		# cargo-make has LICENSE and README.md in same dir, and recursivie copy for each file makes unexpected shims.
		# So DO NOT USE `cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"` here.
		# And `makers` command does not exist in old versions
		cp "${ASDF_DOWNLOAD_PATH}/cargo-make" "$install_path"
		cp "${ASDF_DOWNLOAD_PATH}/makers" "$install_path" || echo "Version $version does not have 'makers' command"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
