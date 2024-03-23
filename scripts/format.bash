#!/usr/bin/env bash

set -euxo pipefail

# This option don't work in old bash as 3.x that installed in macOS
shopt -s globstar

shfmt --language-dialect bash --write \
	./**/*

dprint fmt
