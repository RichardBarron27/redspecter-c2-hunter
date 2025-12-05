#!/usr/bin/env bash
#
# Red Specter: C2 Hunter (Outbound Threat Monitor)
# Author: Richard (Red Specter) + Vigil
# Version: 0.1
#
# Defensive-only tool. Use ONLY on systems/networks you are allowed to monitor.
#

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_NAME="$(basename "$0")"
INTERVAL=30                # seconds between scans (default)
PREFIX="[RED-SPECTER::C2]"

BANNER='
============================================================
   R E D   S P E C T E R   ::   C 2   H U N T E R
            O U T B O U N D   W A T C H
============================================================
'

usage() {
  cat <<EOF
Usage: $SCRIPT_NAME [-i interval_seconds]

Options:
  -i  Scan interval in seconds (default: ${INTERVAL})
  -h  Show this help

Examples:
  sudo ./$SCRIPT_NAME
  sudo ./$SCRIPT_NAME -i 5
EOF
}

# --- parse arguments ---
while getopts ":i:h" opt; do
  case "$opt" in
    i) INTERVAL="$OPTARG" ;;
    h) usage; exit 0 ;;
    \?) usage; exit 1 ;;
  esac
done

echo "$BANNER"
echo "${PREFIX} Starting Red Specter C2 Hunter (v0.1)"
echo "${PREFIX} Interval : ${INTERVAL}s"
echo "${PREFIX} Tip      : Run with sudo for full visibility."
echo

main_loop() {
  while true; do
    ts="$(date '+%Y-%m-%d %H:%M:%S')"

    echo
    echo "${PREFIX} Scan at ${ts}"
    echo "${PREFIX} Active outbound TCP connections (state: ESTABLISHED)"
    echo "PROTO  LOCAL_ADDR           REMOTE_ADDR          PID   PROCESS"

    # ss fields: Netid State Recv-Q Send-Q Local:Port Peer:Port Process
    ss -tnp state established 2>/dev/null | tail -n +2 | \
    while read -r netid state recvq sendq local remote rest; do
      # Skip empty lines
      [[ -z "${remote:-}" ]] && continue

      # Skip localhost / loopback
      if [[ "$remote" == 127.0.0.1* ]] || [[ "$remote" == ::1* ]]; then
        continue
      fi

      # Default process info
      proc="unknown"
      pid="unknown"

      # Try to pull process name and pid from users:(())
      if [[ "$rest" == *"users:(("* ]]; then
        proc="$(echo "$rest" | sed -n 's/.*users:(("\([^"]*\)".*/\1/p')"
        [[ -z "$proc" ]] && proc="unknown"
        pid="$(echo "$rest" | sed -n 's/.*pid=\([0-9]*\).*/\1/p')"
        [[ -z "$pid" ]] && pid="unknown"
      fi

      printf "TCP    %-18s %-18s %-5s %s\n" "$local" "$remote" "$pid" "$proc"
    done

    sleep "$INTERVAL"
  done
}

main_loop
