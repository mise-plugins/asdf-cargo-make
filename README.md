# asdf-cargo-make

[![Build](https://github.com/kachick/asdf-cargo-make/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-cargo-make/actions/workflows/build.yml?query=branch%3Amain) [![Lint](https://github.com/kachick/asdf-cargo-make/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-cargo-make/actions/workflows/lint.yml?query=branch%3Amain) [![rtx](https://github.com/kachick/asdf-cargo-make/actions/workflows/rtx.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-cargo-make/actions/workflows/rtx.yml?query=branch%3Amain)

[cargo-make](https://sagiegurari.github.io/cargo-make/) plugin for the [asdf version manager](https://asdf-vm.com).\
Tested also [rtx](https://github.com/jdxcode/rtx).

# Dependencies

- `bash`, `curl`, `unzip`: generic POSIX utilities.

This plugin requires `unzip` to be installed.

If you have a Debian system like Ubuntu, you can install it by typing
`sudo apt-get install unzip`.

# Install

Plugin:

```shell
asdf plugin add cargo-make https://github.com/kachick/asdf-cargo-make.git
```

[short-name is also available](https://github.com/asdf-vm/asdf-plugins/blob/6498384c22a29602d065d3db681b8f32f7e4295b/plugins/cargo-make#L1) if you turn off [disable_plugin_short_name_repository](https://asdf-vm.com/manage/configuration.html#disable-plugin-short-name-repository)

```shell
asdf plugin add cargo-make
```

cargo-make:

```shell
# Show all installable versions
asdf list-all cargo-make

# Install specific version
asdf install cargo-make latest

# NOTE: This plugin supports only cargo-make 0.16.0+

# Set a version globally (on your ~/.tool-versions file)
asdf global cargo-make latest

# Now cargo-make commands are available
cargo-make make --help
# Latest versions have `makers` command too
makers --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](CONTRIBUTING.md).

# License

See [LICENSE](LICENSE) © [Kenichi Kamiya](https://github.com/kachick/)
