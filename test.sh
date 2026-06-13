#! /usr/bin/env bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"
${PRODUCTION:=true}
VER=3.12

if ! $PRODUCTION; then
	export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
	command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade
	brew install python@$VER
	brew install ffmpeg-full
fi
python$VER -m pip install --upgrade pip
pip$VER install -r requirements.txt
pip$VER install --force-reinstall "faster-whisper @ https://github.com/SYSTRAN/faster-whisper/archive/refs/heads/master.tar.gz"
python$VER app.py $HOME/default.m4a
cat transcription.txt

