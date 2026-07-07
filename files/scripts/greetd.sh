#!/usr/bin/env bash
set -oeux pipefail

systemctl disable gdm.service || true
systemctl disable sddm.service || true
systemctl enable greetd.service
mkdir -p /var/cache/greetd
chown -R greeter:greeter /var/cache/greetd
chmod 0755 /var/cache/greetd
