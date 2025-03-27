#!/bin/bash

# Ensure the script exits on error
set -e

# Function to increment the version number
increment_version() {
    # Get the current tags in the repository
    current_tag=$(gh release list --limit 1 --json tagName -q '.[0].tagName')

    # If no tags exist, set the first tag to v1.0.0
    if [ -z "$current_tag" ]; then
        echo "v1.0.0"
        return
    fi

    # Extract the version number from the current tag
    version="${current_tag#v}"

    # Check if the extracted version is a valid semantic version
    if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Error: Invalid version format detected in tag $current_tag. The version must follow the format 'X.Y.Z' (e.g., '1.2.3')."
        exit 1
    fi

    # Split the version into major, minor, patch
    IFS='.' read -r major minor patch <<< "$version"

    # Increment the patch version (you can adjust this logic to increment major or minor)
    patch=$((patch + 1))

    # Construct the next tag (must start with 'v' and follow semantic versioning)
    next_tag="v$major.$minor.$patch"

    echo "$next_tag"
}

# Function to create a GitHub release using GitHub CLI
create_github_release() {
    tag_name=$1
    release_title="Release $tag_name"
    release_notes="This is the release for version $tag_name."

    echo "Creating GitHub release: $tag_name"

    # Use the correct path format for Windows (if using Git Bash or WSL)
    release_path="./target/release/rust-hello-world"

    # If you're on Windows, check for the .exe file
    if [ "$(uname)" == "MINGW64_NT"* ] || [ "$(uname)" == "MSYS"* ]; then
        release_path="./target/release/rust-hello-world.exe"
    fi

    # Create the GitHub release using the gh CLI
    gh release create "$tag_name" --title "$release_title" --notes "$release_notes" --draft=false
}

# Build first
echo "Building project..."
cargo build --release

# Get the next release tag
next_tag=$(increment_version)

# Debug output for next_tag
echo "Next tag to be used: $next_tag"

# Create the GitHub release
create_github_release "$next_tag"

# List last 3 releases
gh release list --limit 3
