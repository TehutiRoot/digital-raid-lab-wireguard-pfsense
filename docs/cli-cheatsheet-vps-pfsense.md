# CLI Cheatsheet – VPS & pfSense (Digital Raid Lab)

Useful commands used in this lab to configure and verify each component.

## VPS (Linux, WireGuard, iptables)

### WireGuard status

Show WireGuard interfaces and peers
sudo wg show

Show only wg0 interface
sudo wg show wg0


### Routing & IP

List addresses and interfaces
ip addr show

Show routes
ip route show

text

### Packet capture

Capture WireGuard handshake traffic on eth0
sudo tcpdump -ni eth0 udp port 51820

Capture forwarded HTTPS traffic between VPS and internal server
sudo tcpdump -ni wg0 host 10.10.10.20 and port 443

text

### iptables / NAT

Show current NAT table
sudo iptables -t nat -L -n -v

Show FORWARD chain
sudo iptables -L FORWARD -n -v

text

---

## pfSense (Edge firewall)

### Logs & interfaces

- **Status → Interfaces** – confirm wg0 has the expected IP (e.g. 10.100.0.2/32).  
- **Status → System Logs → Firewall** – filter by interface `wg0` to see passes/blocks.

### Packet capture (WebGUI)

- **Diagnostics → Packet Capture**  
  - Interface: `wg0` or `LAN`  
  - Host: internal server IP (e.g. `10.10.10.20`)  
  - Port: `443`  

Download the capture and inspect with Wireshark if needed.

### Shell (Diagnostics → Command Prompt)

Check route to internal host from pfSense
netstat -rn | grep 10.10.10.

Test connectivity from pfSense to internal server
ping -c 4 10.10.10.20

text
undefined
2) สำหรับ NetBird ZTNA Lab – สร้าง docs/cli-cheatsheet-netbird.md
text
# CLI Cheatsheet – NetBird ZTNA Overlay Lab

## NetBird Management Server (Debian/Ubuntu on OCI)

### System & networking

Update packages
sudo apt update && sudo apt upgrade -y

Show IP addresses and routes
ip addr show
ip route show

text

### NetBird service

Check service status
sudo systemctl status netbird

View recent logs
sudo journalctl -u netbird --since "10 min ago"

text

### TLS / DNS checks

Verify that the public hostname resolves correctly
dig +short netbird.example.com

Test HTTPS connectivity from a remote client
curl -vk https://netbird.example.com

text

---

## pfSense / Routing Peer

### Static routes & firewall

- Check **System → Routing → Routes** to confirm overlay ranges are reachable via the NetBird peer.  
- In **Firewall → Rules**, ensure the NetBird subnet is allowed towards the LAN.

Example overlay/net ranges (mock):

- Overlay: `100.64.0.0/10`  
- LAN: `10.20.0.0/24`

---

## Clients (Linux example)

Show NetBird agent status
sudo systemctl status netbird-client

Check assigned overlay IP
ip addr show | grep 100.64.

Ping internal host via overlay
ping -c 4 10.20.0.10

text
undefined

For day‑to‑day operations and troubleshooting commands, see  
`docs/cli-cheatsheet-vps-pfsense.md`.


text
For useful verification and troubleshooting commands, see  
`docs/cli-cheatsheet-netbird.md`.
