#!/usr/bin/env bash
set -oeux pipefail

systemctl disable gdm.service || true
systemctl disable sddm.service || true
systemctl enable greetd.service
