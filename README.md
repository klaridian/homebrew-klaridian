# homebrew-klaridian

Homebrew tap for [**klaridian**](https://github.com/klaridian/klaridian) — generate [Model Context Protocol](https://modelcontextprotocol.io) servers from an OpenAPI spec, with observability plugins and tool curation built in.

```bash
brew install klaridian/klaridian/klaridian
```

This installs a **prebuilt native binary** — no Node.js, no toolchain, nothing to compile. It's the same CLI published to [npm](https://www.npmjs.com/package/klaridian) and [PyPI](https://pypi.org/project/klaridian/), compiled to a standalone executable (the same pattern Speakeasy uses).

## How this tap is updated

`Formula/klaridian.rb` is generated per release from the template + binaries in the [main repo](https://github.com/klaridian/klaridian) (`packaging/homebrew/`). Each klaridian release attaches per-platform binaries to its GitHub Release; the formula points at those with pinned SHA256s. Do not hand-edit the version/SHA lines.

- **Docs:** https://klaridian.dev
- **License:** MIT
