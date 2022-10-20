<div align="center">

# asdf-cargo-make [![Build](https://github.com/kachick/asdf-cargo-make/actions/workflows/build.yml/badge.svg)](https://github.com/kachick/asdf-cargo-make/actions/workflows/build.yml) [![Lint](https://github.com/kachick/asdf-cargo-make/actions/workflows/lint.yml/badge.svg)](https://github.com/kachick/asdf-cargo-make/actions/workflows/lint.yml)


[cargo-make](https://sagiegurari.github.io/cargo-make/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add cargo-make
# or
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
cargo-make --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/kachick/asdf-cargo-make/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Kenichi Kamiya](https://github.com/kachick/)
