#!/bin/bash
set -e
# This script installs Cowrie in the user's home directory and starts it.
# Run in an isolated lab VM with authorization.
sudo apt update
sudo apt install -y git python3-virtualenv python3-pip libssl-dev libpython3-dev build-essential
cd "$HOME"
if [ ! -d cowrie ]; then
  git clone https://github.com/cowrie/cowrie.git
fi
cd cowrie || exit 1
python3 -m virtualenv -p python3 cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt || true
cp etc/cowrie.cfg.dist etc/cowrie.cfg || true
# Start cowrie in background
bin/cowrie start || true
sleep 2
mkdir -p ../evidence/cowrie
cp var/log/cowrie/cowrie.log ../evidence/cowrie/ || true
echo "Cowrie start attempted; check var/log/cowrie for runtime logs."
