<p align="center">
  <img src="https://raw.githubusercontent.com/RichardBarron27/red-specter-offensive-framework/main/assets/red-specter-logo.png" alt="Red Specter Logo" width="200">
</p>

<br>

# 🛡️ Red Specter: C2 Hunter (v0.1 – Bash MVP)

<p align="center">
  <img src="https://img.shields.io/badge/version-v0.1-blue" alt="Version v0.1">
  <img src="https://img.shields.io/badge/type-defensive%20tool-blueviolet" alt="Defensive Tool">
  <img src="https://img.shields.io/badge/focus-outbound%20TCP-orange" alt="Outbound TCP Connections">
  <img src="https://img.shields.io/badge/platform-Linux%20|%20Kali-purple" alt="Platform Linux/Kali">
  <img src="https://img.shields.io/badge/language-Bash-lightgrey" alt="Language Bash">
</p>

> **Lightweight outbound-connection monitor for Linux — shows established TCP sessions leaving your box.**  
Part of the **Red Specter | VIGIL** defensive tooling ecosystem.

---

## 🔍 What It Does

C2 Hunter inspects active outbound TCP connections and displays:

- Local process name & PID  
- Remote IP:port of the connection  
- Connection state (ESTABLISHED)  

It does **not** alter system state, inject packets, or modify firewall rules — it simply monitors and reports.

---

## ⚙️ Quick Start

```bash
chmod +x redspecter-c2-hunter.sh
sudo ./redspecter-c2-hunter.sh -i 5
```

If run without arguments, script defaults to 30-second scan intervals.  
`-i <seconds>` allows custom interval timing.

---

## 📌 Example Output

```
[RED-SPECTER::C2] Scan at 2025-12-05 11:00:00  
[RED-SPECTER::C2] Active outbound TCP connections (ESTABLISHED)  
PROTO  LOCAL_ADDR           REMOTE_ADDR          PID   PROCESS  
TCP    10.0.2.15:55342      93.184.216.34:443   1240  firefox  
```

---

## 🔧 Use Cases

- Detect suspicious beaconing or C2 traffic  
- Monitor unexpected outbound sessions  
- Auditing remote connections from sensitive environments  

---

## 🚀 Roadmap

| Version | Feature |
|--------|---------|
| v0.2 | Optional alert output / highlight unknown remote IPs |
| v0.3 | Persistent beacon-streak detection + logging |
| v0.4 | Whitelist trusted destinations (cloud mirrors, updates) |
| v1.0 | Release-grade version with logging, filters, and alerts |

---

## 🔒 Legal & Ethical Notice

This tool is for **defensive monitoring under authorized use only**.  
Do **not** use on networks or systems without explicit permission.  
Respect privacy, law, and ethical boundaries.

---

## 👥 Credits

**Richard (Red Specter)** — Project Lead & Developer  
**Vigil** — AI-Assisted Co-Development Partner

---

## ☕ Support Red Specter

If you find this tool useful and want to support future Red Specter development:

<p align="center">
  <a href="https://www.buymeacoffee.com/redspecter" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" alt="Buy Me A Coffee Button" />
  </a>
</p>
