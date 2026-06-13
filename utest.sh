#! /usr/bin/env bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"
${PRODUCTION:=true}
apt update
apt install ffmpeg
cd $HOME
rm -rf $DIR
echo $PROJECT
git clone https://github.com/Danielzapirtan/"$PROJECT"
cd $DIR
python -m pip install --upgrade pip
pip install -r requirements.txt
pip install faster-whisper
python3 app.py $HOME/default.m4a
cat transcription.txt

