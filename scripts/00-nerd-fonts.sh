#!/usr/bin/env bash
# Download and unpack patched icon fonts
FONTS="
RobotoMono
"
# Make sure curl and unzip are installed
if [ ! "$(type -P curl)" ]; then echo "curl is required, make sure it is installed"; exit 1; fi
if [ ! "$(type -P unzip)" ]; then echo "unzip is required, make sure it is installed"; exit 2; fi

USER="ryanoasis"
REPO="nerd-fonts"
API="https://api.github.com/repos/$USER/$REPO/releases/latest"
TAG="$(curl -s $API | grep 'tag_name' | cut -d \" -f 4)"
if [ -z "$TAG" ]; then echo "Unable to retrieve latest release tag"; exit 3; fi
if [ -d "$HOMETMP" ]; then TMPDIR=$HOMETMP; else TMPDIR="$(mktemp -d)"; fi
cd "$TMPDIR" || exit 4 # Exit if this fails, otherwise bad things might happen

URL="https://github.com/$USER/$REPO/releases/download/$TAG"
CURL="curl -LOC -"

for FONT in $FONTS; do
    # Make sure the destination directory is not already occupied
    INSTALL_DIR="$HOME/.local/share/fonts/$FONT"
    if [ -d "$INSTALL_DIR" ]; then
        echo "Skipping $FONT, already installed at $INSTALL_DIR"
        continue
    fi

    # Download phase
    echo "Downloading $FONT"
    if $CURL "$URL"/"$FONT".zip; then
        # Unpack phase
        mkdir -p "$INSTALL_DIR"
        unzip -q ./"$FONT".zip -d "$INSTALL_DIR"
        printf "\n"
    else
        # Download failed
        echo "... Failed! Skipping"
        continue
    fi

done
echo "Finished!"
rm -rf "$TMPDIR"
