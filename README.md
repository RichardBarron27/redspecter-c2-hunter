# Red Specter: C2 Hunter

![Language](https://img.shields.io/badge/Bash-Script-blue?style=flat-square)
![Status](https://img.shields.io/badge/Version-v0.1-green?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-purple?style=flat-square)

Red Specter: C2 Hunter is a lightweight defensive monitoring tool for Linux that lists **active outbound TCP connections**.

It helps provide early visibility into potential:
- Malware beaconing to C2 servers
- Unauthorized external communication
- Persistent remote callbacks

Designed for Red Specter lab and blue team monitoring use.

---

## ✔ Features

- Shows established outbound TCP connections
- Displays associated **PID** and **process name**
- Extremely lightweight (pure Bash)
- Helps detect suspicious or unknown external traffic

---

## 🚀 Usage

```bash
sudo ./redspecter-c2-hunter.sh -i 5
Flag	Description
-i	Scan interval seconds (default: 30)
-h	Show help menu

Requires sudo for full visibility into processes.

📌 Example Output
[RED-SPECTER::C2] Scan at 2025-12-05 11:00:00
[RED-SPECTER::C2] Active outbound TCP connections (ESTABLISHED)
PROTO  LOCAL_ADDR           REMOTE_ADDR          PID   PROCESS
TCP    10.0.2.15:54312      93.184.216.34:443   1240  firefox

🔒 Legal Notice

For authorized defensive monitoring only.
Never scan networks or systems without permission.

👥 Credits

Richard (Red Specter) — Founder & Operator
Vigil — AI Co-Intelligence Partner

☕ Support Red Specter

If you find this tool useful and want to support future Red Specter development:

<p align="center"> <a href="https://www.buymeacoffee.com/redspecter" target="_blank"> <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" alt="Buy Me A Coffee Button" /> </a> </p> ```
