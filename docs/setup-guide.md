# Setup Guide – Hosting Behind CGNAT with WireGuard & pfSense

## Lab Environment

- Home network behind CGNAT (ISP router)
- pfSense as edge firewall/router
- OCI VPS (Ubuntu, free tier) with public IP
- WireGuard on both VPS and pfSense

Example (mock) addressing:

- Home LAN: 10.10.10.0/24
- pfSense WG: 10.100.0.2/32
- VPS WG: 10.100.0.1/32
- Internal server: 10.10.10.20
- VPS public IP: 203.0.113.10

## Step 1 – Configure WireGuard on VPS

- Install WireGuard on Ubuntu.
- Create `/etc/wireguard/wg0.conf` (see `configs/wg0.conf.vps.example`).
- Enable IP forwarding and add DNAT/SNAT rules (see `configs/iptables.example.sh`).

## Step 2 – Configure WireGuard on pfSense

- Install WireGuard package.
- Create tunnel interface with 10.100.0.2/32.
- Add peer pointing to 203.0.113.10:51820 with allowed IPs 10.100.0.0/24,10.10.10.0/24.
- Create firewall rules for the WG interface and gateway routes.

## Step 3 – Publish an internal service

- On VPS: DNAT 203.0.113.10:8443 → 10.10.10.20:443 over wg0.
- On pfSense: allow traffic from WG network to 10.10.10.20.
- Test with curl or browser against https://203.0.113.10:8443.

## Step 4 – Forensics & Verification

- Capture packets on VPS `eth0` and `wg0` to verify handshakes and forwarded traffic.
- Capture packets on pfSense WG interface and LAN interface.
- Correlate with pfSense firewall logs (see files in `forensics/`).
