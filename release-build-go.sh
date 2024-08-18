#!/bin/bash

usage() {
    echo "Usage: $0 <release_version> <app_name>"
    echo ""
    echo "Example: $0 1.1.0 mail2go"
    exit 1
}

if [ "$#" -ne 2 ]; then
    usage
fi

VERSION="$1"
APP_NAME="$2"

oses=("windows" "linux")
architectures=("amd64" "arm64")

for arch in "${architectures[@]}"; do
    mkdir -p "releases/${arch}" "build/${arch}"
done

for os in "${oses[@]}"; do
    for arch in "${architectures[@]}"; do
        OUTPUT="build/${arch}/${APP_NAME}"

        if [ "$os" == "windows" ]; then
            OUTPUT+=".exe"
        fi

        echo "Building for ${os}/${arch}..."
        GOOS=$os GOARCH=$arch CGO_ENABLED=0 go build -a -installsuffix cgo -o "${OUTPUT}" .

        if [ $? -ne 0 ]; then
            echo "Failed to build for ${os}/${arch}"
            exit 1
        fi

        echo "Packaging ${os}/${arch} binary..."
        tar -czf "releases/${arch}/${APP_NAME}_${os}_${arch}_${VERSION}.tar.gz" -C "build/${arch}" "$(basename "$OUTPUT")"
    done
done

echo "Build and packaging completed successfully!"

