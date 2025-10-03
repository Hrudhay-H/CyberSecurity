# Firewall (iptables only)

Objective
---------
Implement host-level filtering with iptables: deny inbound by default, allow loopback and established traffic, permit SSH.

Tools
-----
- iptables
- iptables-save / iptables-restore

Methodology
-----------
1. Flush existing rules.
2. Set default policies (INPUT DROP, FORWARD DROP, OUTPUT ACCEPT).
3. Allow loopback and established sessions.
4. Allow SSH (adjust port if required).
5. Save snapshot for evidence and possible restoration.

Usage
-----
```bash
chmod +x commands.sh
sudo ./commands.sh
```

Notes
-----
- If running remotely via SSH, ensure SSH allow rule exists before applying DROP policy.
- For persistence, use `iptables-persistent` or system startup scripts.
