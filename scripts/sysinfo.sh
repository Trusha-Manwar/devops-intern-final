#!/bin/bash

set -euo pipefail

echo "===== System Information ====="
echo "Hostname: $(hostname)"
echo "OS: $(uname -s)"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "CPU Cores: $(nproc)"

echo "===== Memory ====="
free -h

echo "===== Disk Usage ====="
df -h /

echo "===== Uptime ====="
uptime
