# Use Cases & Service Mapping

This lab is not just a home‑lab experiment; it is a reusable blueprint for several real‑world scenarios.

## Law‑Enforcement / Cybercrime Units

- **Digital raid preparation**  
  - Build a controlled access path to targets behind CGNAT or carrier‑grade firewalls.  
  - Pre‑validate routing, NAT and firewall behaviour before sending a team on‑site.

- **Remote evidence acquisition**  
  - Securely reach servers, NAS devices or application endpoints for log and image collection.  
  - Use network and firewall logs from this lab as a template for evidential logging in live operations.

- **Network forensics training**  
  - Reproduce common misconfigurations (wrong AllowedIPs, missing routes, broken NAT) and train analysts to diagnose them with tcpdump and pfSense logs.

## SME / Enterprise Use Cases

- **Secure self‑hosting behind CGNAT**  
  - Publish internal dashboards, monitoring, or management interfaces via a hardened VPS instead of exposing them directly.

- **Zero‑trust remote access**  
  - Combine this design with NetBird or additional WireGuard peers to implement identity‑aware access into specific subnets and services.

## Freelance / Consulting Services

This repository underpins several commercial services, for example:

- Design and implementation of secure remote‑access solutions for home labs, SMEs, and investigative teams.  
- Troubleshooting and hardening of existing VPN / CGNAT / port‑forwarding setups.  
- Training sessions on WireGuard, pfSense and network forensics using this lab as a practical reference.

Clients can inspect this repository to verify the technical depth and to review anonymised examples of configurations, logs, and analysis workflows.
