# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test cargo-make https://github.com/kachick/asdf-cargo-make.git "cargo-make make --version"
```

Tests are automatically run in GitHub Actions on push and PR.

## Tools

```console
$ git clone git@github.com:kachick/asdf-cargo-make.git
$ cd asdf-cargo-make
$ asdf plugin add cargo-make https://github.com/kachick/asdf-cargo-make.git
$ asdf install
cargo-make 0.36.2 is already installed
shellcheck 0.8.0 is already installed
shfmt 3.5.1 is already installed

$ makers --list-all-steps
...
Tools
----------
format - No Description.
lint - No Description.
...

$ makers --task lint
[cargo-make] INFO - makers 0.36.2
[cargo-make] INFO - Build File: Makefile.toml
[cargo-make] INFO - Task: lint
[cargo-make] INFO - Profile: development
[cargo-make] INFO - Running Task: lint
[cargo-make] INFO - Build Done in 0.54 seconds.
```
