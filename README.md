# homebrew-tap

Homebrew formulae for [devtree](https://github.com/SergeyLubivui-dev/devtree).

```bash
brew install SergeyLubivui-dev/tap/devtree
devtree help
```

Or tap first, if you prefer:

```bash
brew tap SergeyLubivui-dev/tap
brew install devtree
```

## What is in here

| Formula | What it installs |
|---|---|
| `devtree` | Tree-shaped development planning that lives inside your repository |

The formula installs the released binary rather than building from source.
devtree has no dependencies and cross-compiles in CI, so a build here would add
nothing but a Go toolchain on every machine that installs it.

macOS and Linux, Intel and Apple silicon.

## How it stays current

`.github/workflows/update.yml` checks devtree's latest release every day. When
there is a new one, it rewrites the version, the URLs, and the checksums in the
formula and commits the change. Nothing is copied by hand, so the tap cannot
quietly fall a release behind.

To pull an update immediately, run the workflow from the Actions tab.

## License

The formula is [MIT](LICENSE), like devtree itself.
