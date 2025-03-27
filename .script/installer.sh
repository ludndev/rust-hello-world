#!/usr/bin/env sh

# Latest release information comes from: https://api.github.com/repos/ludndev/rust-hello-world/releases/latest
# Get inspiration of what have been done here: https://rustup.rs/

PLATFORM="unknown"

detect_platform() {
    if [ "$(uname)" = "Darwin" ]; then
        PLATFORM="darwin"
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
        PLATFORM="unix"
    elif [ "$(expr substr $(uname -s) 1 7)" = "MSYS_NT" ] ||
         [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ] ||
         [ "$(expr substr $(uname -s) 1 10)" = "MINGW64_NT" ]; then
        PLATFORM="win"
    fi
}

main() {
    detect_platform
    echo "Detected platform: $PLATFORM"
}

main
