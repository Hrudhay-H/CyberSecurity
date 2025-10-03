# Nmap — Top 10 Commands You Actually Need (Cheat-Sheet)

Fast, pragmatic, and audit-friendly. Copy-paste these into your Kali terminal — but **only** against assets you own or have written permission to test. This is the operational playbook: concise commands, quick rationale, and evidence filenames for your report. No corporate sugar — just results.

---

## TL;DR
Use these commands to discover hosts, enumerate services, fingerprint OSes, and generate reproducible evidence. Always get permission — scanning without authorization is a career-limiting move.

---

## 1) Quick host discovery (ping sweep)
```bash
nmap -sn 192.168.1.0/24
```
**When:** find live hosts fast.  
**Why:** low-noise, no port scan.

---

## 2) Basic TCP port scan (default 1k ports)
```bash
nmap 192.168.1.10
```
**When:** first reconnaissance.  
**Why:** quick snapshot of common services.

---

## 3) Scan all TCP ports (1–65535)
```bash
nmap -p- 192.168.1.10
```
**When:** hunt non-standard ports.  
**Why:** exhaustive, slower.

---

## 4) Service & version detection
```bash
nmap -sV 192.168.1.10
```
**When:** map software versions for vulnerability triage.

---

## 5) Aggressive scan (OS, versions, scripts, traceroute)
```bash
nmap -A 192.168.1.10
```
**When:** deep fingerprinting (post-permission).  
**Why:** OS detection, NSE, traceroute — noisy, but informative.

---

## 6) SYN stealth scan (fast & common pen-test scan)
```bash
sudo nmap -sS 192.168.1.10
```
**When:** faster and stealthier than a full connect (`-sT`).  
**Why:** requires root, commonly used in pentests.

---

## 7) UDP scan (discover UDP services)
```bash
sudo nmap -sU 192.168.1.10
```
**When:** DNS/SNMP/NTP suspected.  
**Why:** slow because UDP lacks handshake.

---

## 8) Nmap Scripting Engine (NSE)
Default scripts + version detection:
```bash
nmap -sC -sV 192.168.1.10
```
Specific script example:
```bash
nmap --script=http-title -p 80 192.168.1.10
```
**When:** automate banner grabs, basic checks, HTTP enumeration.

---

## 9) Timing templates (speed / stealth tuning)
```bash
nmap -T4 192.168.1.10    # faster (LAN)
nmap -T2 192.168.1.10    # slower, stealthier
```
**When:** balance speed vs IDS footprint.

---

## 10) Save output (multi-format for evidence)
```bash
nmap -oA myscan 192.168.1.10
```
Creates `myscan.nmap`, `myscan.xml`, `myscan.gnmap` — ideal for reports and automation.

---

## Bonus combos — pragmatic one-liners
Deep but usable:
```bash
sudo nmap -A -T4 -oA target_report 192.168.1.10
```
Full port + version + vuln scripts (loud — get permission):
```bash
sudo nmap -p- -sV --script vuln 192.168.1.10
```

---

## Suggested evidence filenames (drop into `evidences/`)
- `evidences/nmap_quicksweep.png` — `-sn` output screenshot  
- `evidences/nmap_basic.png` — default scan output  
- `evidences/nmap_allports.png` — `-p-` summary  
- `evidences/nmap_service_version.png` — `-sV` output  
- `evidences/nmap_aggressive.png` — `-A` output  
- `evidences/nmap_report.nmap` / `.xml` / `.gnmap` — from `-oA target_report`

---

## Quick legal & operational checklist — tell it like it is
- **Get written permission.** Scope, IPs, time window. No exceptions.  
- **Use lab targets** (localhost, isolated VMs, Metasploitable, etc.).  
- **Be mindful of impact:** `-A`, `--script vuln`, and `-sU` can degrade services.  
- **Capture outputs** with `-oA` for reproducible evidence.

---

## Example — polite, thorough scan (drop into your pipeline)
```bash
# polite deep scan: full port, version detection, safe NSE, save outputs
sudo nmap -p- -sV --script "default and safe" -T4 -oA evidence/nmap_target_report 10.0.2.15
```
Change `10.0.2.15` to your lab VM IP. Use `evidence/` path to keep outputs organized for REPORT.md.

---

If you want, I’ll:
- Save this as `nmap-cheatsheet.md` and auto-commit it to your repo, or  
- Generate a ready-to-run `scan_and_capture.sh` that runs a polite scan and places results into `evidences/`.  

Which one, Boss?
