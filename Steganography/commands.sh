#!/bin/bash
set -e
echo "Secret coordinates: 13.331, 76.962" > secret_message.txt
# Try to copy a cover image from the user's Pictures folder; if not present, a placeholder will be used instead.
cp ~/Pictures/cover.jpg ./cover.jpg || true
# Embed secret inside cover.jpg
steghide embed -cf cover.jpg -ef secret_message.txt -p 'StegPass123' || true
steghide info cover.jpg > ../evidence/steghide_info.txt || true
steghide extract -sf cover.jpg -p 'StegPass123' -xf secret_message.txt || true
cat secret_message.txt > ../evidence/secret_message_extracted.txt || true
