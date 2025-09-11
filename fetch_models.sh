#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
mkdir -p app/src/main/assets/www/models
cd app/src/main/assets/www/models

BASES=(
  "https://cdn.jsdelivr.net/npm/@vladmandic/face-api/model/"
  "https://raw.githubusercontent.com/justadudewhohacks/face-api/master/weights/"
  "https://raw.githubusercontent.com/vladmandic/face-api/master/model/"
)

FILES=(
  "tiny_face_detector_model-weights_manifest.json"
  "tiny_face_detector_model-shard1.bin"
  "face_landmark_68_tiny_model-weights_manifest.json"
  "face_landmark_68_tiny_model-shard1.bin"
  "face_recognition_model-weights_manifest.json"
  "face_recognition_model-shard1.bin"
)

echo "Downloading models into $(pwd)"
for f in "${FILES[@]}"; do
  saved=0
  for b in "${BASES[@]}"; do
    url="${b}${f}"
    echo "Trying ${url}"
    if command -v curl >/dev/null 2>&1; then
      curl -fSL -o "${f}" "${url}" && { echo "Saved ${f}"; saved=1; break; } || true
    fi
    if command -v wget >/dev/null 2>&1; then
      wget -q --show-progress -O "${f}" "${url}" && { echo "Saved ${f}"; saved=1; break; } || true
    fi
  done
  if [ "${saved}" -eq 0 ]; then
    echo "WARN: failed to download ${f}. You may need to fetch it manually."
  fi
done

echo "Download attempt finished. Files in folder:"
ls -lah
