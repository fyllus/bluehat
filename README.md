
# bluehat &nbsp; [![bluebuild build badge](https://github.com/fyllus/bluehat/actions/workflows/build.yml/badge.svg)](https://github.com/fyllus/bluehat/actions/workflows/build.yml)

A minimalist, performance-oriented custom Fedora Atomic image built on top of the uBlue (`base-main`) ecosystem.

This image is an independent, personal project designed to be lightweight, pragmatic, and highly optimized. It eliminates standard desktop bloat, focusing exclusively on a keyboard-driven workflow using the Sway window manager, native Wayland utilities, and modular shell-based orchestration tools.

---

## Key Features

* **Minimalist TWM Stack:** Pre-configured Sway environment leveraging resource-efficient tools like `i3blocks` and `wmenu`, alongside custom scripts located in `/usr/bin`.
* **Modular Configuration Architecture:** Completely decoupled keybindings, system calls, and theme variables to prevent system breakage and allow safe, painless user overrides.
* **Integrated CLI Orchestration:** Built-in shell-based tools featuring custom fuzzy finders (`sway-menu`, `sway-wall`) for application execution, scratchpads, interactive wallpaper selection, and power management.
* **Atomic Reliability:** Built via BlueBuild, ensuring immutable root-filesystem rollbacks, seamless updates, and container-native delivery.

For detailed documentation, architectural layouts, and configuration guides, [visit the BlueHat Wiki](https://github.com/fyllus/bluehat/wiki).

---

## Installation

To rebase an existing Fedora Atomic (e.g., Silverblue, Kinoite, Sway Spin) installation to the latest Bluehat build, execute the two-step verification process below:

### 1. Initial Unverified Rebase

Rebase to the unverified registry to import the required signing keys and local security policies:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/fyllus/bluehat:latest
systemctl reboot

```

### 2. Verified Signed Rebase

After rebooting, lock the system deployment down by rebasing to the cryptographically signed image stream:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/fyllus/bluehat:latest
systemctl reboot

```

> **Note:** The `latest` tag always tracks the stable core version specified within the system build recipe. Major upstream Fedora version upgrades will never occur automatically without user intervention.

---

## Verification

Container images are signed using [Sigstore](https://www.sigstore.dev/) and [Cosign](https://github.com/sigstore/cosign). To manually audit and verify the integrity of the image signature, pull the public key from this repository and run:

```bash
cosign verify --key cosign.pub ghcr.io/fyllus/bluehat

```

---

## Local ISO Generation

Offline installer ISOs cannot be hosted directly on GitHub due to size limitations. To compile your own bootable installation media locally, follow the official guidelines:

```bash
# Reference deployment guidelines at:
# [https://blue-build.org/how-to/generate-iso/](https://blue-build.org/how-to/generate-iso/)

```
