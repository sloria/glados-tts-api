# glados-tts-api

OpenAI-compatible API to use the GladOS TTS model from https://github.com/dnhkng/GLaDOS.

## Running the server

### Option 1: With Python/uv (for local development)

With [uv installed](https://docs.astral.sh/uv/getting-started/installation/), install dependencies and download models using the `glados` CLI.

```
uv sync
uv run glados download
```

Then run the server with

```
make serve
```

### Option 2: With Docker

Use the following commmand to build and run the server with docker compose

```
make serve-docker
```

which is equivalent to

```
docker compose up -d
```

## Making requests

```console
curl -X POST http://localhost:5050/v1/audio/speech \
  -H "Content-Type: application/json" \
  -d '{
    "input": "You look great, by the way. Very healthy."
  }' \
  --output speech.mp3
```

## Usage with Open WebUI

1. Run the server using one of the methods above
1. Admin Panel > Settings > Audio > TTS Settings: Text-to-Speech Engine = OpenAI. API Base URL = http://localhost:5050/v1. API Key = doesntmatter. TTS Voice = glados. TTS Model = glados. Response splitting = None. Save.

![Open WebUI audio settings](https://github.com/user-attachments/assets/5753dcab-463d-478b-b7c2-9d33432f56ca)
