# Cybersecurity Assignment — 4 Lines of Defence (Kali Linux CLI) 
# Report
---

## 1) ENCRYPTION (OpenSSL only)
Objective
---------
Protect file confidentiality using OpenSSL for symmetric (AES) and asymmetric (RSA) workflows; demonstrate encrypt/decrypt and validate integrity.

Tools
-----
- openssl
- sha256sum

Methodology & Commands (Kali CLI)
---------------------------------
Create a sample plaintext:
```bash
echo "Top secret: Vyaapti project roadmap" > secret.txt
```

Symmetric (AES-256-CBC):
```bash
openssl enc -aes-256-cbc -salt -pbkdf2 -iter 200000 -in secret.txt -out secret.txt.enc -pass pass:'S3cureP@ss!'
openssl enc -d -aes-256-cbc -pbkdf2 -iter 200000 -in secret.txt.enc -out secret_decrypted.txt -pass pass:'S3cureP@ss!'
sha256sum secret.txt secret_decrypted.txt
```

RSA (small payload demo):
```bash
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private.pem
openssl rsa -in private.pem -pubout -out public.pem
openssl pkeyutl -encrypt -inkey public.pem -pubin -in secret.txt -out secret.rsa
openssl pkeyutl -decrypt -inkey private.pem -in secret.rsa -out secret_rsa_decrypted.txt
sha256sum secret.txt secret_rsa_decrypted.txt
```

## 2) FIREWALL (iptables only)
Objective
---------
Demonstrate host-level filtering using `iptables`: implement secure baseline (deny incoming by default, allow loopback, allow established, permit SSH), show rules and persistence snapshot.

Commands (example):
```bash
sudo iptables -F
sudo iptables -P INPUT DROP
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables-save > firewall/iptables-rules.v4.txt
```

## 3) STEGANOGRAPHY
Objective
---------
Hide data inside a carrier file (image) and extract it to prove confidentiality-in-depth.

Commands (example):
```bash
sudo apt update && sudo apt install -y steghide exiftool
steghide embed -cf cover.jpg -ef secret_message.txt -p 'StegPass123'
steghide extract -sf cover.jpg -p 'StegPass123'
```

## 4) HONEYPOT (Cowrie)
Objective
---------
Deploy a low-interaction honeypot to capture attacker connection attempts and command activity for detection and analysis.

Quick start (example):
```bash
git clone https://github.com/cowrie/cowrie.git
cd cowrie
python3 -m virtualenv -p python3 cowrie-env
source cowrie-env/bin/activate
pip install -r requirements.txt
bin/cowrie start
tail -n 200 var/log/cowrie/cowrie.log
```

---

# Evidence checklist
- evidence/encryption_hashes.txt
- evidence/iptables-rules.v4.txt
- evidence/steghide_info.txt
- evidence/secret_message_extracted.txt
- evidence/cowrie/cowrie.log (redact IPs if required)

*End of report.*
