#!/usr/bin/env bash
set -euo pipefail

ENV_NAME="${1:-audio-srt}"
APP_NAME="${APP_NAME:-AudioSRTGUI}"
DATE_TAG="$(date +%Y%m%d)"
ARTIFACT_ROOT="$(pwd)/old/build_artifacts"
WORK_PATH="${ARTIFACT_ROOT}/build"
DIST_PATH="${ARTIFACT_ROOT}/dist"
SPEC_PATH="${ARTIFACT_ROOT}/spec"

# Avoid sandbox/permission issues with default ~/Library cache path.
export PYINSTALLER_CONFIG_DIR="${PYINSTALLER_CONFIG_DIR:-/tmp/pyinstaller_audio_srt}"

mkdir -p "${WORK_PATH}" "${DIST_PATH}" "${SPEC_PATH}"

echo "Building ${APP_NAME}.app with conda env: ${ENV_NAME}"
conda run -n "${ENV_NAME}" pyinstaller \
  --noconfirm \
  --clean \
  --windowed \
  --name "${APP_NAME}" \
  --workpath "${WORK_PATH}" \
  --distpath "${DIST_PATH}" \
  --specpath "${SPEC_PATH}" \
  --collect-data=faster_whisper \
  --hidden-import=faster_whisper \
  --hidden-import=av \
  --hidden-import=numpy \
  gui_app.py

DIST_APP="${DIST_PATH}/${APP_NAME}.app"
RELEASE_DIR="$(pwd)/release"
RELEASE_APP="${RELEASE_DIR}/${APP_NAME}_${DATE_TAG}.app"
RELEASE_LATEST="${RELEASE_DIR}/${APP_NAME}.app"

mkdir -p "${RELEASE_DIR}"
rm -rf "${RELEASE_APP}" "${RELEASE_LATEST}"
cp -R "${DIST_APP}" "${RELEASE_APP}"
cp -R "${DIST_APP}" "${RELEASE_LATEST}"

echo "Release (dated): ${RELEASE_APP}"
echo "Release (latest): ${RELEASE_LATEST}"
echo "Intermediate dist: ${DIST_APP}"
echo "Done"
