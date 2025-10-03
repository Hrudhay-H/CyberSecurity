#!/bin/bash
set -e
mkdir -p evidence
cd encryption && bash commands.sh || true && cd ..
cd firewall && sudo bash commands.sh || true && cd ..
cd steganography && bash commands.sh || true && cd ..
cd honeypot && bash setup_cowrie.sh || true && cd ..
echo "All PoC scripts attempted. Check ./evidence for outputs."
