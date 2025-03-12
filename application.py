# This file is for autodiscovery by the litestar CLI,
# so we don't need to pass an app every time or use an environment variable.
from app.app import app

__all__ = ["app"]
