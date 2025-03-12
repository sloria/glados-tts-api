import io

import soundfile
from glados.TTS import tts_glados
from glados.utils import spoken_text_converter


def write_glados_audio_file(f: str | io.BytesIO, text: str) -> None:
    glados_tts = tts_glados.Synthesizer()
    converter = spoken_text_converter.SpokenTextConverter()
    converted_text = converter.text_to_spoken(text)
    # Generate the audio to from the text
    audio = glados_tts.generate_speech_audio(converted_text)
    soundfile.write(
        f,
        audio,
        glados_tts.sample_rate,
        format="MP3",
    )
