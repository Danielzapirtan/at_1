#! /bin/bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"

cd $HOME
test -d $VENV || python -m venv venv
. venv/bin/ activate &>/dev/null || true
rm -rf $DIR
echo $PROJECT
git clone https://github.com/Danielzapirtan/"$PROJECT"
cd $DIR
pip install -r requirements.txt
python3 app.py $HOME/default.m4a
cat transcription.txt

