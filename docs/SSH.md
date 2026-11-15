# SSH on the Kindle

Two ways to get SSH. Pick based on what you need.

## Option 1 — KOReader's built-in SSH (simplest, zero install)

Works while KOReader is running, over Wi-Fi. Good for dragging books over SFTP.

1. KOReader → top menu → gear → **Network** → **SSH server** → **Start**.
2. The popup shows the Kindle's IP and port (default 2222).
3. Connect: `ssh root@<ip> -p 2222` (SFTP on the same port).
4. To log in without a password you must first enable
   "Login without password (DANGEROUS)" once, add your key, then disable it.

## Option 2 — USBNetwork (system-level SSH, works without KOReader)

Install: `Update_usbnet_0.22.N_install_pw2_and_up.bin` into `mrpackages/`,
then `;log mrpi`.

Configuration lives at `usbnet/etc/config` on the drive (after install).
Key settings:

```sh
USE_WIFI="true"        # enable SSH over Wi-Fi
USE_OPENSSH="true"     # use OpenSSH instead of dropbear
```

Copy your public key to `usbnet/etc/authorized_keys` for passwordless login.

Toggle with `;un` in the search bar (or the KUAL → USBNetwork menu).

> Warning (from the author's own README): USBNetwork switches the USB port to
> ethernet mode and is aimed at people with Linux sysadmin experience. If you
> only want to move books around wirelessly, use Option 1.
