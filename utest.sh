#! /usr/bin/env bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"
MACOS=$(uname | grep -q Darwin)
echo $MACOS
${PRODUCTION:=true}

if $MACOS; then
	echo "Platform not supported"
	exit 2
fi
apt update
apt install ffmpeg
cd $HOME
rm -rf $DIR
echo $PROJECT
git clone https://github.com/Danielzapirtan/"$PROJECT"
cd $DIR
python -m pip install --upgrade pip
pip install -r requirements.txt
if $MACOS; then
	pip install --force-reinstall "faster-whisper @ https://github.com/SYSTRAN/faster-whisper/archive/refs/heads/master.tar.gz"
else
	pip install faster-whisper
fi
python3 app.py $HOME/default.m4a
cat transcription.txt

