#! /bin/bash

PROJECT="at_1"
DIR=$HOME/"$PROJECT"
MACOS=$(uname | grep -q Darwin)
${PRODUCTION:=true}

if $MACOS; then
	if ! $PRODUCTION; then
		export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
		command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		brew install python@3.12
		brew install ffmpeg-full
	fi
else
	cd $HOME
	rm -rf $DIR
	echo $PROJECT
	git clone https://github.com/Danielzapirtan/"$PROJECT"
	cd $DIR
fi
pip install -r requirements.txt
python3 app.py $HOME/default.m4a
cat transcription.txt

