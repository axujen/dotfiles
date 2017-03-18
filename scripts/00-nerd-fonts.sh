#!/usr/bin/env sh
# Download and unpack patched icon fonts

# Make sure curl and unzip are installed
command -v wget  2>&1 > /dev/null || echo "wget is required, make sure it is installed."
command -v unzip 2>&1 > /dev/null || echo "unzip is required, make sure it is installed."

URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0"
FONTS=( AnonymousPro BitstreamVeraSansMono DejaVuSansMono DroidSansMono Terminus UbuntuMono )
TMPDIR=/tmp/nerd-fonts

[ ! -d $TMPDIR ] && mkdir -p $TMPDIR
cd $TMPDIR || exit 1 # Exit if this fails, otherwise bad things might happen

for FONT in "${FONTS[@]}"; do
    # Make sure the destination directory is not already occupied
    INSTALL_DIR="$HOME/.local/share/fonts/$FONT"
    if [ -d $INSTALL_DIR ]; then
        echo "Skipping $FONT, it seems to be already installed!"
        echo "If its not already installed then manually delete $INSTALL_DIR"
        echo ""
        continue
    fi

    # Download phase
    echo "Installing $FONT"
    wget --quiet --show-progress --no-check-certificate --continue "$URL/$FONT.zip"
    # Make sure the download succeded before attempting to unpack
    if [ ! $? == 0 ]; then
        echo "Download failed, skipping"
        continue
    fi


    # Unpack phase
    mkdir -p $INSTALL_DIR
    unzip -q ./$FONT.zip -d $INSTALL_DIR
    echo ""
done

echo "Finished!"
