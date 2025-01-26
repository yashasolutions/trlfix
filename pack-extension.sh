#!/bin/bash

# Load .env
source .env

# Pack the extension
$CHROME_PATH --pack-extension=$EXTENSION_DIR --pack-extension-key=$OUTPUT_DIR/key.pem

echo "Extension packed successfully!"
 
