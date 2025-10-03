# Encryption (OpenSSL only)

Objective
---------
Protect file confidentiality using OpenSSL (AES-256-CBC symmetric) and RSA (asymmetric) for demonstration.

Tools
-----
- openssl
- sha256sum

Methodology
-----------
1. Create `secret.txt`.
2. Encrypt with AES-256-CBC using OpenSSL (PBKDF2 + iteration).
3. Decrypt and verify hashes.
4. Demonstrate RSA keypair encryption for small payload (RSA is not for large files).

Usage
-----
Make the script executable and run it in an isolated Kali VM:
```bash
chmod +x commands.sh
./commands.sh
```

Notes
-----
- Do NOT commit `private.pem` to a public repository.
- For larger files, use hybrid encryption (AES for file, RSA to encrypt AES key).
