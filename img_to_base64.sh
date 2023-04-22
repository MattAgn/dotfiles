#!/bin/bash

# Check if an image path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/image"
    exit 1
fi

# Set the image path from the command-line argument
image_path="$1"

# Set a maximum width and height for the resized image
max_width=5
max_height=5
quality=20


# Create a temporary file for the resized image
temp_resized_image=$(mktemp)

# Resize the image using ImageMagick
convert "$image_path" -resize "${max_width}x${max_height}>" -quality "$quality" "$temp_resized_image" 

# Encode the resized image to Base64 using openssl
img_base64=$(openssl base64 -A -in "$temp_resized_image")

# Save the Base64-encoded string to a file
output_file="base64_image.txt"
echo "$img_base64" > "$output_file"
echo "The Base64-encoded (compressed) image has been saved to the file: $output_file"

# Remove the temporary resized image file
rm "$temp_resized_image"
