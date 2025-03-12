FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
  libportaudio2 \
  portaudio19-dev \
  git \
  && rm -rf /var/lib/apt/lists/*

RUN pip install uv

WORKDIR /app
COPY pyproject.toml uv.lock .python-version README.md application.py ./
COPY models/ ./models/

# Install dependencies and download glados models
RUN uv sync --no-dev --frozen \
  && uv run glados download

COPY src/ ./src/
EXPOSE 5050
CMD ["uv", "run", "litestar", "run", "--host", "0.0.0.0", "--port", "5050", "--debug"]
