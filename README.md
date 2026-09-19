# tallica/tap

Personal Homebrew tap.

## Install

```
brew tap tallica/tap
brew install tallica/tap/<formula>
```

## Formulae

_None yet._

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
