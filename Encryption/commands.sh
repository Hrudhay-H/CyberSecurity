#!/bin/bash
set -e
# Symmetric AES-256-CBC using OpenSSL
echo "Top secret: Vyaapti project roadmap" > secret.txt
openssl enc -aes-256-cbc -salt -pbkdf2 -iter 200000 -in secret.txt -out secret.txt.enc -pass pass:'S3cureP@ss!'
openssl enc -d -aes-256-cbc -pbkdf2 -iter 200000 -in secret.txt.enc -out secret_decrypted.txt -pass pass:'S3cureP@ss!'
sha256sum secret.txt secret_decrypted.txt > ../evidence/encryption_hashes.txt

# RSA keypair (small payload demo)
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private.pem
openssl rsa -in private.pem -pubout -out public.pem
openssl pkeyutl -encrypt -inkey public.pem -pubin -in secret.txt -out secret.rsa
openssl pkeyutl -decrypt -inkey private.pem -in secret.rsa -out secret_rsa_decrypted.txt
sha256sum secret.txt secret_rsa_decrypted.txt >> ../evidence/encryption_hashes.txt
