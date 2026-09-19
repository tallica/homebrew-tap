# tallica/tap

Personal Homebrew tap.

## Install

```
brew tap tallica/tap
brew install tallica/tap/<formula>
```

## Formulae

| Formula | Description |
| --- | --- |
| [`incus-compose`](Formula/incus-compose.rb) | Drop-in replacement for docker compose that runs your compose.yaml on Incus |

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
