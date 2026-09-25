# Changelog

All notable changes to this tap will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Entries are grouped by date rather than release version, since this tap is not versioned software.

## [2026-09-25]

### Changed

- `lazyincus`: bumped to `v0.9.0`.

## [2026-09-22]

### Added

- `pomodoro` cask: new Pomodoro timer app, installed from prebuilt macOS release binary
  (`v0.1.0`). `--only-tap-syntax` in CI already covers Casks (`brew style`/`readall`/`audit`
  run tap-wide), so no CI changes were needed.

## [2026-09-20]

### Changed

- `lazyincus`: bumped to `v0.8.1` and switched from a source build to prebuilt release binaries
  (macOS arm64/amd64, Linux arm64/amd64), now that release tarballs are published. `--HEAD`
  installs still build from source via `make build`.

## [2026-09-19]

### Added

- Basic tap structure: `README.md`, `LICENSE` (MIT), and CI workflow using `brew test-bot`.
- `incus-compose` formula.
- `lazyincus` formula (builds from source; no release binaries yet).

### Fixed

- `incus-compose`: fix `brew test-bot --only-tap-syntax` failures — `readall --os=all --arch=all`
  errored because no URL was defined for Linux, and `audit` flagged the explicit `version` as
  redundant with the version scanned from the URL. Added `depends_on :macos` with Linux-side URL
  stanzas (unused at install time, only present so readall can parse the formula) and dropped the
  explicit `version`.
- `lazyincus`: `--HEAD` builds reported a stale version (e.g. `v0.6.1-22-gfd5f7d8` for a commit
  actually tagged `v0.7.0`) because Homebrew's HEAD git checkout fetches with `tagOpt=--no-tags`,
  so the Makefile's `git describe --tags` couldn't see release tags. `install` now runs
  `git fetch --tags origin` before building on HEAD.
