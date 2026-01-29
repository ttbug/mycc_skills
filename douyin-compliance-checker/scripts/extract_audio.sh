#!/bin/bash
# Extract audio track from video using ffmpeg
# Usage: ./extract_audio.sh <video_path> <output_audio_path>

set -e

VIDEO_PATH="$1"
OUTPUT_PATH="${2:-audio.wav}"

if [ -z "$VIDEO_PATH" ]; then
    echo "Usage: $0 <video_path> [output_audio_path]"
    exit 1
fi

if [ ! -f "$VIDEO_PATH" ]; then
    echo "Error: Video file not found: $VIDEO_PATH"
    exit 1
fi

# Check if video has audio stream
HAS_AUDIO=$(ffprobe -v error -select_streams a -show_entries stream=codec_type -of default=noprint_wrappers=1:nokey=1 "$VIDEO_PATH" 2>/dev/null | head -1)

if [ -z "$HAS_AUDIO" ]; then
    echo "Warning: No audio stream found in video"
    exit 0
fi

echo "Extracting audio to ${OUTPUT_PATH}..."

# Extract audio as WAV (16kHz mono for whisper compatibility)
ffmpeg -i "$VIDEO_PATH" \
    -vn \
    -acodec pcm_s16le \
    -ar 16000 \
    -ac 1 \
    "$OUTPUT_PATH" \
    -y -loglevel warning

echo "Audio extracted successfully: ${OUTPUT_PATH}"
