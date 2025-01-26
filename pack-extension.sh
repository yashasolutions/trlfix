#!/bin/bash

# Load .env
source .env

# Pack the extension

echo "Packing extension..."

# Create the output directory
mkdir -p $OUTPUT_DIR

if [ ! -f $OUTPUT_DIR/key.pem ]; then
    echo "Creating key.pem..."
    $CHROME_PATH --pack-extension=$EXTENSION_DIR
    mv $EXTENSION_DIR.pem $OUTPUT_DIR/key.pem
    mv $EXTENSION_DIR.crx $OUTPUT_DIR/$EXTENSION_NAME.crx
else
    $CHROME_PATH --pack-extension=$EXTENSION_DIR --pack-extension-key=$OUTPUT_DIR/key.pem
fi

echo "Extension packed successfully!"
