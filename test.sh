PROJECT="at_1"
DIR=$HOME/"$PROJECT"
MACOS=$(uname | grep -q Darwin)
${PRODUCTION:=true}

if $MACOS; then
	if ! $PRODUCTION; then
		export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
		command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		brew update
		brew upgrade
		brew install python@3.11
		brew install ffmpeg-full
	fi
else
	apt update
	apt install ffmpeg
	cd $HOME
	rm -rf $DIR
	echo $PROJECT
	git clone https://github.com/Danielzapirtan/"$PROJECT"
	cd $DIR
fi
pithon -m pip install --upgrade pip
pip install -r requirements.txt
if $MACOS; then
	pip install --force-reinstall "faster-whisper @ https://github.com/SYSTRAN/faster-whisper/archive/refs/heads/master.tar.gz"
else
	pip install faster-whisper
fi
python3 app.py $HOME/default.m4a
cat transcription.txt

