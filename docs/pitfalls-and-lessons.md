
# Pitfalls, Gotchas & Lessons Learned

This lab was built and tested against a real CGNAT environment using pfSense, WireGuard and an OCI VPS.  
The notes below collect the most important issues encountered during the PoC and how they were solved.

## 1. CGNAT behaviour is not obvious

- The home router performed carrier‑grade NAT, so no inbound port‑forward from the ISP side was possible.
- The only reliable option was to **initiate** the WireGuard tunnel from the CGNAT side to the VPS.
- Lesson: always design CGNAT setups so that the private side dials out to a fixed public endpoint.

## 2. Overlapping subnets break routing

- Early tests reused 192.168.x.x ranges already present in the home network.
- As a result, return traffic followed the wrong path or was dropped by pfSense.
- Solution: reserve a dedicated overlay range (e.g. 10.100.0.0/24) for WireGuard and keep it unique across all sites.

## 3. “Tunnel is up but nothing passes”

Common root causes seen in the logs and tcpdump captures:

- AllowedIPs too narrow or too broad on either side.
- Missing routes on pfSense (no gateway for the WG interface).
- Firewall rules missing on the WG interface or LAN.
- NAT on the VPS not translating traffic back to the WireGuard source.

Checklist:

- `wg show` on both ends (handshake, transfer counters).  
- pfSense firewall logs filtered by WG interface (blocked vs passed).  
- `tcpdump` on VPS `eth0` and `wg0` to confirm which leg of the path is failing.

## 4. Multi‑layer firewall confusion

- OCI Security Lists, Linux iptables, and pfSense rules all had to agree.
- A single forgotten rule (e.g. dropped UDP/51820 on the VPS) resulted in “dead” tunnels.
- Recommendation: start with very permissive rules during PoC, verify the full path, then tighten step by step.

## 5. Logging for forensics and troubleshooting

- Enabling logging on pfSense rules for WireGuard and NAT traffic was essential.
- A small set of structured logs from both pfSense and the VPS was enough to reconstruct the entire path during later review.
- For production, logs should be shipped to a central system (e.g. syslog/ELK/Graylog) for long‑term retention and correlation.
