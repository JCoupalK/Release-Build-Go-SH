# Release-Build-Go-SH

`Release-Build-Go-SH` is a Bash script designed to quickly build and release a Go project for multiple architectures and operating systems. The script automates the process of building Go binaries, packaging them into tarballs, and organizing them into platform-specific directories for easy distribution.

## Usage

```bash
./release-build-go.sh <release_version> <app_name>
```

This command will build the Go application for all supported platforms and package the binaries into `.tar.gz` files, named according to the version, OS, and architecture.

## Supported Platforms

The script currently supports the following operating systems and architectures:

- Operating Systems:
  - Windows
  - Linux

- Architectures:
  - amd64
  - arm64

## Output Structure

The script, with the default OSes and archs, organizes the built binaries and tarballs into the following directory structure:
```text
releases/
├── amd64/
│   ├── <app_name>_linux_amd64_<release_version>.tar.gz
│   └── <app_name>_windows_amd64_<release_version>.tar.gz
└── arm64/
    ├── <app_name>_linux_arm64_<release_version>.tar.gz
    └── <app_name>_windows_arm64_<release_version>.tar.gz

build/
├── amd64/
│   ├── <app_name>
│   └── <app_name>.exe
└── arm64/
    ├── <app_name>
    └── <app_name>.exe
```

## Extending the Script

To add support for additional platforms (OS/architectures), simply modify the `oses` and `architectures` arrays in the script:
```bash
oses=("windows" "linux" "darwin")
architectures=("amd64" "arm64" "386")
```

The script will automatically create the necessary directories and build the binaries for any new combinations added.

## Prerequisites

- Go installed: Ensure that Go is installed and properly configured on your machine.
- Bash: The script is designed to run in a Unix-like shell, such as Bash. It should work on any system that supports Bash, including Linux, macOS, and Windows with WSL or Git Bash.

## Contributing

Contributions are welcome. Please fork the repository and submit a pull request with your changes or improvements.

## License

This project is licensed under MIT - see the LICENSE file for details.
