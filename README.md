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
