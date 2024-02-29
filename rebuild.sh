#!/usr/bin/env bash
set -e

echo "-----------------------------------------"
echo "    Finding script's real full path...   "
echo "-----------------------------------------"
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
	SOURCE=$(readlink "$SOURCE")
	[[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)

pushd $DIR
echo "-----------------------------------------"
echo "        Formatting configurations...     "
echo "-----------------------------------------"
alejandra . &>/dev/null

echo "-----------------------------------------"
echo "           Rebuilding NixOS...           "
echo "-----------------------------------------"
sudo nixos-rebuild switch --flake .#default &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

echo "-----------------------------------------"
echo "NixOS built, committing current iteration"
echo "-----------------------------------------"
CURRENT=$(nixos-rebuild list-generations | grep current)
echo "$CURRENT"
git diff -U0 *
git add .
git commit -m "$CURRENT"

echo "-----------------------------------------"
echo "                  Done!                  "
echo "-----------------------------------------"
popd
