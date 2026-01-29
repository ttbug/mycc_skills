#!/bin/bash
# Extract key frames from video using ffmpeg
# Usage: ./extract_frames.sh <video_path> <output_dir> [interval_seconds]

set -e

VIDEO_PATH="$1"
OUTPUT_DIR="$2"
INTERVAL="${3:-3}"  # Default: extract 1 frame every 3 seconds

if [ -z "$VIDEO_PATH" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: $0 <video_path> <output_dir> [interval_seconds]"
    exit 1
fi

if [ ! -f "$VIDEO_PATH" ]; then
    echo "Error: Video file not found: $VIDEO_PATH"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Get video duration
DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$VIDEO_PATH" 2>/dev/null | cut -d. -f1)

if [ -z "$DURATION" ] || [ "$DURATION" -eq 0 ]; then
    echo "Error: Could not determine video duration"
    exit 1
fi

echo "Video duration: ${DURATION}s, extracting 1 frame every ${INTERVAL}s..."

# Extract frames at specified interval
ffmpeg -i "$VIDEO_PATH" \
    -vf "fps=1/${INTERVAL}" \
    -q:v 2 \
    "${OUTPUT_DIR}/frame_%04d.jpg" \
    -y -loglevel warning

# Count extracted frames
FRAME_COUNT=$(ls -1 "${OUTPUT_DIR}"/frame_*.jpg 2>/dev/null | wc -l | tr -d ' ')

echo "Extracted ${FRAME_COUNT} frames to ${OUTPUT_DIR}"
