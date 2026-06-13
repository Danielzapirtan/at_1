#! /usr/bin/env bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"
MACOS=$(uname | grep -q Darwin)
echo $MACOS
${PRODUCTION:=true}

if ! $MACOS; then
	echo "Platform not supoorted"
	exit 2
fi
if ! $PRODUCTION; then
	export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
	command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade
	brew install python@3.12
	brew install ffmpeg-full
fi
python -m pip install --upgrade pip
pip install -r requirements.txt
pip install --force-reinstall "faster-whisper @ https://github.com/SYSTRAN/faster-whisper/archive/refs/heads/master.tar.gz"
python3 app.py $HOME/default.m4a
cat transcription.txt

