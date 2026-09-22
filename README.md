# tallica/tap

Personal Homebrew tap.

## Install

```
brew tap tallica/tap
brew trust --tap tallica/tap
brew install tallica/tap/<formula>
```

`brew trust` is required because this is a non-official tap — without it,
Homebrew will refuse to load its formulae.

## Formulae

| Formula | Description |
| --- | --- |
| [`incus-compose`](Formula/incus-compose.rb) | Drop-in replacement for docker compose that runs your compose.yaml on Incus |
| [`lazyincus`](Formula/lazyincus.rb) | Terminal UI for Incus, in the style of lazydocker |

## Casks

| Cask | Description |
| --- | --- |
| [`pomodoro`](Casks/pomodoro.rb) | Menu bar timer for the Pomodoro technique |

## Adding a formula

```
brew create --tap tallica/tap <url>
```

Then edit the generated file in `Formula/` and test with:

```
brew install --build-from-source tallica/tap/<formula>
brew test tallica/tap/<formula>
brew audit --strict tallica/tap/<formula>
```
