# rust-hello-world

This project is a testing repo for publishing Rust packages to various package registries and ecosystems.

The primary objective is to understand the processes, requirements, procedures, and potential obstacles when publishing
Rust packages to repositories such as Crates.io, Github, Docker Hub, Winget, Debian and others.

This experimentation will provide invaluable insights into cross-platform Rust development and deployment.

Please note that this is strictly for testing purposes.

## One Line Installer

FYI, latest release json data come from `https://api.github.com/repos/ludndev/rust-hello-world/releases/latest`

```shell
curl --proto '=https' --tlsv1.2 -sSf https://ludndev.github.io/rust-hello-world/installer.sh | sh
```

## REGISTRIES

- [x] DockerHub Container Registry
- [x] GitHub Container Registry
- [] Gitlab Container Registry

## PLATFORMS

- [x] cURL One Line Installer
- [] PowerShell Installer
- [] Winget
- [] Chocolately
- [] Nuget
- [] Scoop.sh (Windows)
- [] Debian/Ubuntu Packages
- [] Alpine Packages
- [] Darwin (macOS) as pkg/dmg
- [] Homebrew (formulae or/and cask)
- [] MacPorts
- [] Etc

## LICENSE

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
