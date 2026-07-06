# taventech/homebrew-tap

Homebrew formulas for Taven / Hedge command-line tools.

## Install

```sh
brew install taventech/tap/hedge     # the Hedge broker CLI  (command: hedge)
brew install taventech/tap/bindly    # the Bindly CLI        (command: bindly)
```

Or tap first, then install by short name:

```sh
brew tap taventech/tap
brew install hedge
brew install bindly
```

Each formula installs a self-contained standalone binary (no Node.js required).

## Other install options

- npm: `npm i -g hedge-broker` (provides `hedge`) · `npm i -g bindly-cli` (provides `bindly`)
- curl: `curl -fsSL https://github.com/taventech/hedge-cli/releases/latest/download/install.sh | sh`

## Updating a formula on release

Bump `version` and replace the `sha256` values with the checksums of the new
darwin binaries from the release (`shasum -a 256 hedge-darwin-arm64 hedge-darwin-x64`).
