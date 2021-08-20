#!/usr/bin/env bash
clear

echo "== PASSING OPERATIONS TO STARTUP =="

echo "[INFO] Alpine Developer Image by DanningtonSystems"

echo "[INIT] Ensuring that all dependencies are completely updated.."

echo "== PASSING CONTROL TO APK =="
apk add --no-cache --update git ffmpeg curl wget gnupg ca-certificates bind-tools sqlite python3 tzdata xz libatomic bash zsh alpine-sdk sudo starship nano
echo "== RESTORING CONTROL TO STARTUP =="

echo "[INIT] Opening command interpreter (/bin/zsh).."
echo "== PASSING CONTROL TO ZSH =="
/bin/zsh