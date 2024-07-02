#!/bin/sh
set -e

echo "Activating feature 'food-101'"

DATASET_URL="http://data.vision.ee.ethz.ch/cvl/food-101.tar.gz"
DATASET_DIR="food-101"
TAR_PATH="$DATASET_DIR/food-101.tar.gz"


if [ ! -d "$DATASET_DIR" ]; then
    echo "Creating directory: $DATASET_DIR"
    mkdir -p "$DATASET_DIR"
fi

if [ -f "$TAR_PATH" ] || [ "$(ls -A $DATASET_DIR)" ]; then
    echo "Food-101 dataset already exists. No action needed."
else
    echo "Downloading Food-101 dataset"
    curl -L -o "$TAR_PATH" "$DATASET_URL"


    echo "Extracting Food-101 dataset"
    tar -xzf "$TAR_PATH" -C "$DATASET_DIR"

    
    echo "Cleaning up"
    rm "$TAR_PATH"

    echo "Food-101 dataset downloaded and extracted successfully."
fi