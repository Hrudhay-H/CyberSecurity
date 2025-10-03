# Steganography

Objective
---------
Hide a message inside an image file using `steghide` and demonstrate extraction.

Tools
-----
- steghide
- exiftool (optional)
- strings (optional)

Methodology
-----------
1. Prepare `secret_message.txt`.
2. Use `steghide embed` to hide the message in `cover.jpg`.
3. Verify with `steghide info` and extract with `steghide extract`.
4. Save extracted output to `evidence/` for submission.

Usage
-----
```bash
sudo apt update
sudo apt install -y steghide exiftool
chmod +x commands.sh
./commands.sh
```

Notes
-----
- Steganography should be used in combination with encryption for defense-in-depth.
