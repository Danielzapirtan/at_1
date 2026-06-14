#! /usr/bin/env bash

PROJECT="at_1"
DIR=$(pwd)
${PRODUCTION:=true}
VER=3.12

if ! $PRODUCTION; then
	export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
	command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade
	brew install python@$VER
	brew install ffmpeg-full
	cd
	python3 -m venv venv
	. venv/bin/activate
	cd $DIR
fi
python$VER -m pip install --upgrade pip
pip$VER install -r requirements.txt
pip$VER install --force-reinstall "faster-whisper @ https://github.com/SYSTRAN/faster-whisper/archive/refs/heads/master.tar.gz"
if $PRODUCTION; then
	cd
	rm -rf $DIR
	git clone https://github.com/Danielzapirtan/at_1.git
	cd $PROJECT
fi
python$VER app.py $HOME/default.m4a
cat transcription.txt

