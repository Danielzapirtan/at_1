#! /usr/bin/env bash

PROJECT="at_1"
DIR=$(pwd)
${PRODUCTION:=true}

brew update
brew install ffmpeg
python3.12 -m pip install --upgrade pip
pip install -r requirements.txt
pip install faster-whisper
python3 app.py $HOME/default.m4a
cat transcription.txt

