# tallica/tap

Personal Homebrew tap. A tap is just a collection of formula files (Ruby
DSL) that tell `brew` how to install software; there is no application
code here.

## Layout

- `Formula/*.rb` — one formula per file, class name is the CamelCase
  version of the filename (e.g. `incus-compose.rb` → `IncusCompose`).
- `README.md` — has a formula table that must be kept in sync with
  `Formula/`.
- `CHANGELOG.md` — grouped by date (not by release version, since a tap
  isn't versioned software). Add an entry under today's date for any
  formula addition/update.
- `.github/workflows/tests.yml` — CI runs `brew test-bot` (cleanup,
  setup, tap-syntax, formulae) on `macos-latest` for pushes to `main`
  and PRs.

## Adding or updating a formula

```
brew create --tap tallica/tap <url>
```

Then edit the generated file and verify locally before committing:

```
brew install --build-from-source tallica/tap/<formula>
brew test tallica/tap/<formula>
brew audit --strict tallica/tap/<formula>
```

When bumping a formula's version, update both `url` and `sha256` for
every platform/arch block (this tap currently ships macOS arm64 + amd64
binaries only — see `on_macos`/`on_arm`/`on_intel` in
`Formula/incus-compose.rb`).

Prefer pointing formulae at prebuilt release binaries (as
`incus-compose.rb` does) over building from source — it keeps installs
fast and avoids needing build toolchains/dependencies on the user's
machine. Only build from source when no suitable binary release exists.

After any formula change, update `README.md`'s formula table and add a
`CHANGELOG.md` entry.
