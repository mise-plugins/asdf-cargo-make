#!/usr/bin/env bash

set -euxo pipefail

# This option don't work in old bash as 3.x that installed in macOS
shopt -s globstar

shellcheck --shell=bash --external-sources \
	bin/* --source-path=lib/ \
	lib/* \
	scripts/*

shfmt --language-dialect bash --diff \
	./**/*.bash bin/**/*

dprint check

typos . .github .vscode
