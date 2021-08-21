#!/usr/bin/env bash
clear

echo "== PASSING OPERATIONS TO STARTUP =="

echo "[INFO] Ubuntu (Latest LTS) Developer Image by DanningtonSystems"

echo "[INIT] Ensuring that all dependencies are completely updated.."

echo "== PASSING CONTROL TO APT =="
apt update
apt upgrade -y
echo "== RESTORING CONTROL TO STARTUP =="

echo "[INIT] Opening command interpreter (/bin/zsh).."
echo "== PASSING CONTROL TO ZSH =="
/bin/zsh