# asdf-cargo-make [![Build](https://github.com/kachick/asdf-cargo-make/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-cargo-make/actions/workflows/build.yml?query=branch%3Amain) [![Lint](https://github.com/kachick/asdf-cargo-make/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-cargo-make/actions/workflows/lint.yml?query=branch%3Amain)


[cargo-make](https://sagiegurari.github.io/cargo-make/) plugin for the [asdf version manager](https://asdf-vm.com).

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `unzip`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add cargo-make https://github.com/kachick/asdf-cargo-make.git
```

cargo-make:

```shell
# Show all installable versions
asdf list-all cargo-make

# Install specific version
asdf install cargo-make latest

# Set a version globally (on your ~/.tool-versions file)
asdf global cargo-make latest

# Now cargo-make commands are available
makers --version
cargo-make make --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/kachick/asdf-cargo-make/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Kenichi Kamiya](https://github.com/kachick/)
