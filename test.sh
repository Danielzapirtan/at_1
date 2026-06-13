#! /bin/bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"

cd $HOME
if command -v brew; then
	brew install python@3.12
	brew install ffmpeg
fi
test -d $VENV || python3.12 -m venv venv
. venv/bin/activate &>/dev/null || true
rm -rf $DIR
echo $PROJECT
git clone https://github.com/Danielzapirtan/"$PROJECT"
cd $DIR
pip install -r requirements.txt
python3 app.py $HOME/default.m4a
cat transcription.txt

