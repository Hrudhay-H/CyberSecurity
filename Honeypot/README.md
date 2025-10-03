# Honeypot (Cowrie)

Objective
---------
Deploy Cowrie honeypot to capture attacker connection attempts and commands for analysis.

Tools
-----
- cowrie (https://github.com/cowrie/cowrie)
- git, python3, virtualenv, pip

Methodology
-----------
1. Clone Cowrie repository.
2. Create virtualenv and install requirements.
3. Configure `etc/cowrie.cfg` if needed.
4. Start Cowrie and collect logs from `var/log/cowrie` and `var/lib/cowrie`.

Safety
------
- Run only in an isolated lab or authorized DMZ. Honeypots attract real attackers.
- Monitor disk usage and rotate logs.
