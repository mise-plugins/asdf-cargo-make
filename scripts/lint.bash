#!/usr/bin/env bash

set -euxo pipefail

shellcheck --shell=bash --external-sources \
	bin/* --source-path=lib/ \
	lib/* \
	scripts/*

shfmt --language-dialect bash --diff \
	./**/*

dprint check

typos . .github .vscode
