[private]
default:
  just --list

# watch for changes and test script
test-watch:
  ls ./src/extract | entr doas bats ./test/test.bats

# test script
test:
  bats ./test/test.bats

# run script
run:
  ./src/extract

build:
  nix-build
