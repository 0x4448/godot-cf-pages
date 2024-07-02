#!/usr/bin/env bash
set -eu

function download {
  url="$1"
  checksum="$2"

  output=$(mktemp)
  curl --location --silent --show-error \
    --connect-timeout 5 \
    --retry 5 \
    --max-time 300 \
    --output "$output" \
    "$url"

  if ! echo "$checksum $output" | sha256sum --check --status; then
    exit 1
  fi

  echo "$output"
}

godotVersion="4.2.2"
godotChecksum="69eb9881e1b82ab93924c83106a7c031497f252bc0c08e199e4da6380072d6ef"
godotUrl="https://github.com/godotengine/godot/releases/download/${godotVersion}-stable/Godot_v${godotVersion}-stable_linux.x86_64.zip"

tempDir=$(mktemp -d)
file=$(download "$godotUrl" "$godotChecksum")
unzip -d "$tempDir" "$file"
install "$tempDir/Godot_v${godotVersion}-stable_linux.x86_64" /usr/local/bin/godot

lfsVersion="3.5.1"
lfsChecksum="6f28eb19faa7a968882dca190d92adc82493378b933958d67ceaeb9ebe4d731e"
lfsUrl="https://github.com/git-lfs/git-lfs/releases/download/v${lfsVersion}/git-lfs-linux-amd64-v${lfsVersion}.tar.gz"

tempDir=$(mktemp -d)
file=$(download "$lfsUrl" "$lfsChecksum")
tar -C "$tempDir" -xzf "$file"
install "$tempDir/git-lfs-${lfsVersion}/git-lfs" /usr/local/bin/git-lfs

find /tmp -maxdepth 1 -name "tmp.*" -exec rm -rf {} \;
