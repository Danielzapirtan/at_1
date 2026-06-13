#! /bin/bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"

cd $HOME
PRODUCTION=$(uname | grep -q Darwin)
if $PRODUCTION; then
	command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

