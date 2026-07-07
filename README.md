# bluehat &nbsp; [![bluebuild build badge](https://github.com/fyllus/bluehat/actions/workflows/build.yml/badge.svg)](https://github.com/fyllus/bluehat/actions/workflows/build.yml)

A minimalist, performance-oriented custom Fedora Atomic image built on top of the Ublue (`base-main`) ecosystem.

This image is an independent personal project designed to be lightweight, pragmatic, and highly optimized. It eliminates standard desktop bloat, focusing exclusively on a keyboard-driven workflow using the Sway TWM, native Wayland utilities (`i3blocks`, `wl-clipboard`), and modular shell-based orchestration tools.

## Key Features

* **Minimalist TWM Stack:** Pre-configured Sway environment leveraging resource-efficient tools like `i3blocks` and `wmenu`.
* **Integrated CLI Orchestration:** Built-in shell-based tools featuring custom fuzzy finders for `.desktop` execution, workspace management, scratchpads, and power menus.
* **Optimized Shell Environment:** Deep integration with environment variables via `/etc/environment` and modular profile hooks for system-wide performance.
* **Atomic Reliability:** Built via BlueBuild, ensuring immutable rollbacks and cloud-native container delivery.

---

## Installation

To rebase an existing Fedora Atomic installation to the latest build, follow the two-step verification process below:

### 1. Initial Unverified Rebase

Rebase to the unsigned registry to import the required signing keys and local policies:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/fyllus/bluehat:latest
systemctl reboot

```

### 2. Verified Signed Rebase

After rebooting, lock the system down by rebasing to the cryptographically signed image:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/fyllus/bluehat:latest
systemctl reboot

```

> **Note:** The `latest` tag always tracks the stable core version specified within `recipe.yml`. Major upstream Fedora version upgrades will never occur automatically.

---

## Verification

The container images are signed using [Sigstore](https://www.sigstore.dev/) and [Cosign](https://github.com/sigstore/cosign). To manually audit and verify the image signature, pull the public key from this repository and execute:

```bash
cosign verify --key cosign.pub ghcr.io/fyllus/bluehat

```

---

## Local ISO Generation

Offline installer ISOs cannot be hosted directly on GitHub due to storage limitations. To compile your own installation media locally from a Fedora Atomic workstation, follow the standard blueprint:

```bash
# Reference deployment guidelines at:
# https://blue-build.org/how-to/generate-iso/

```
