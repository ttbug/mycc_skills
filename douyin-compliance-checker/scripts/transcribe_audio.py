#!/usr/bin/env python3
"""
Transcribe audio using local Whisper model.
Usage: python transcribe_audio.py <audio_path> [--model base] [--language zh]
"""

import argparse
import sys
import os

def check_whisper_installed():
    """Check if whisper is installed, provide installation instructions if not."""
    try:
        import whisper
        return True
    except ImportError:
        print("Error: openai-whisper not installed.")
        print("\nInstall with:")
        print("  pip install openai-whisper")
        print("\nOr with conda:")
        print("  conda install -c conda-forge openai-whisper")
        return False

def transcribe(audio_path: str, model_name: str = "base", language: str = "zh") -> dict:
    """
    Transcribe audio file using Whisper.

    Args:
        audio_path: Path to audio file (wav, mp3, etc.)
        model_name: Whisper model size (tiny, base, small, medium, large)
        language: Language code (zh for Chinese)

    Returns:
        dict with 'text' (full transcript) and 'segments' (timestamped segments)
    """
    import whisper

    if not os.path.exists(audio_path):
        raise FileNotFoundError(f"Audio file not found: {audio_path}")

    print(f"Loading Whisper model: {model_name}...")
    model = whisper.load_model(model_name)

    print(f"Transcribing: {audio_path}...")
    result = model.transcribe(
        audio_path,
        language=language,
        verbose=False
    )

    return {
        "text": result["text"],
        "segments": [
            {
                "start": seg["start"],
                "end": seg["end"],
                "text": seg["text"]
            }
            for seg in result["segments"]
        ]
    }

def main():
    parser = argparse.ArgumentParser(description="Transcribe audio using Whisper")
    parser.add_argument("audio_path", help="Path to audio file")
    parser.add_argument("--model", default="base",
                        choices=["tiny", "base", "small", "medium", "large"],
                        help="Whisper model size (default: base)")
    parser.add_argument("--language", default="zh",
                        help="Language code (default: zh for Chinese)")
    parser.add_argument("--output", "-o", help="Output file path (optional)")

    args = parser.parse_args()

    if not check_whisper_installed():
        sys.exit(1)

    try:
        result = transcribe(args.audio_path, args.model, args.language)

        # Output transcript
        print("\n" + "="*50)
        print("TRANSCRIPT:")
        print("="*50)
        print(result["text"])

        print("\n" + "="*50)
        print("TIMESTAMPED SEGMENTS:")
        print("="*50)
        for seg in result["segments"]:
            start = f"{int(seg['start']//60):02d}:{seg['start']%60:05.2f}"
            end = f"{int(seg['end']//60):02d}:{seg['end']%60:05.2f}"
            print(f"[{start} -> {end}] {seg['text']}")

        # Save to file if requested
        if args.output:
            import json
            with open(args.output, 'w', encoding='utf-8') as f:
                json.dump(result, f, ensure_ascii=False, indent=2)
            print(f"\nTranscript saved to: {args.output}")

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
