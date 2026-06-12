# Audio Transcription

A Google Colab-oriented audio transcription tool built with Faster-Whisper.

Repository:
- Python CLI application for transcription
- Colab notebook workflow
- GPU acceleration support
- Romanian and multilingual transcription

## Features

- Transcribes audio files using Faster-Whisper
- Supports GPU acceleration in Google Colab
- Automatic or manual language selection
- Multiple Whisper model sizes
- Supports:
  - MP3
  - WAV
  - M4A
  - FLAC
  - OGG
  - AAC

## Repository Structure

```text
.
├── app.py
├── requirements.txt
├── audio_transcription_60513_0115.ipynb
└── README.md
```

## Google Colab Usage

Recommended runtime:
- Runtime -> Change runtime type -> GPU
- Tested with NVIDIA T4 runtime

### Notebook Workflow

Open the notebook:

- `audio_transcription_60513_0115.ipynb`

The notebook:
1. Installs dependencies
2. Clones the repository
3. Installs Python packages
4. Runs the transcription CLI

## Manual Installation

Install FFmpeg:

```bash
sudo apt-get install ffmpeg
```

Install Python dependencies:

```bash
pip install -r requirements.txt
```

## Run Locally

```bash
python app.py
```

The application will ask for:
- audio file path
- language
- model size

## Available Models

| Model | Speed | Accuracy |
|---|---|---|
| tiny | fastest | lowest |
| base | fast | balanced |
| small | medium | good |
| medium | slower | high |
| large | slowest | highest |

## Supported Languages

Examples:
- English (`en`)
- Romanian (`ro`)
- Spanish (`es`)
- French (`fr`)
- German (`de`)
- Italian (`it`)
- Portuguese (`pt`)
- Russian (`ru`)
- Japanese (`ja`)
- Korean (`ko`)
- Chinese (`zh`)

Or use:

```text
auto
```

for automatic language detection.

## Output

The transcription is saved as:

```text
transcription.txt
```

## Dependencies

Main dependency:

- faster-whisper

Additional packages are listed in:

- `requirements.txt`

## Notes

- Large Whisper models require substantial GPU memory.
- Colab GPU runtimes are recommended for medium and large models.
- First model load may download Whisper weights from Hugging Face.
