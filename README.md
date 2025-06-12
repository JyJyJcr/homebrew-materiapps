# homebrew-materiapps

## develop info

I configured workflows as below:

- test: all changed formula files are checked by `brew install` (without bottle)
- deploy: push tag `(pre)release/[formula]/[version]`, then (pre)release will be available
