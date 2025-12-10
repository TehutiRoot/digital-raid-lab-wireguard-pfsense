# digital-raid-lab-wireguard-pfsense
Cloud-assisted access lab using WireGuard and pfSense for digital raid and evidence collection scenarios.

# Digital Raid Lab – WireGuard, pfSense & OCI

## Overview

This repository documents a practical lab environment for reaching and inspecting systems located behind CGNAT and complex NAT chains.  
It combines a cloud VPS (Oracle Cloud Infrastructure), WireGuard tunnels, and pfSense to simulate law‑enforcement style “digital raid” scenarios and secure remote evidence collection.

## Objectives

- Build a repeatable lab for studying remote access into hard‑to‑reach networks (home/SME/field sites).  
- Practice network forensics, packet analysis, and firewall rule design in realistic VPN topologies.  
- Provide a reference design that can be adapted to support cybercrime investigations and incident response.

## Architecture

Core components:

- **pfSense** – Edge firewall/router on the private side (home lab or SME network).  
- **OCI Free‑Tier VPS** – Public entry point with a static IP, running Linux.  
- **WireGuard** – Encrypted tunnels between pfSense and the cloud VPS (site‑to‑site and remote‑access modes).  
- **Linux firewall (iptables / nftables)** – DNAT/SNAT and traffic control on the VPS.  
- Optional: **Pi‑hole / AdGuard Home** – DNS filtering and security policies for VPN clients.

The lab is designed so that all sensitive internal services remain behind pfSense, while the cloud VPS exposes only the minimum required endpoints.

## Use Cases

- Preparing “digital raid” access paths for targets located behind CGNAT or carrier‑grade firewalls.  
- Remote access to home/SME infrastructure for triage, log collection, and forensic acquisition.  
- Training environment for WireGuard troubleshooting, routing/NAT debugging, and firewall hardening.  
- Reference design for secure remote work or zero‑trust‑style deployments.

## Lab Layout

Repository structure (planned):

- `docs/` – Network diagrams, architecture notes, and step‑by‑step walkthroughs.  
- `configs/` – Sanitised pfSense, WireGuard, and firewall configuration examples.  
- `scripts/` – Helper scripts for bringing up tunnels, applying DNAT/SNAT rules, and checking routes.  
- `forensics/` – Sample packet captures, log snippets, and analysis workflows used in the lab.

Sensitive values such as real IP addresses, keys, and credentials are **never** stored in this repository.  
All configuration examples are anonymised and meant for educational and demonstration purposes only.

## Key Features

- **CGNAT bypass** using WireGuard and a cloud VPS, without exposing internal hosts directly.  
- **Multi‑layer firewalling** across OCI Security Lists, Linux firewall, and pfSense rules.  
- **Network forensics workflows** using tcpdump and pfSense logs to trace sessions end‑to‑end.  
- **Modular design** that can be extended with additional sites, monitoring, and zero‑trust controls.

## Future Work

Planned additions:

- Detailed “runbooks” for digital raid preparation and remote evidence collection.  
- Example case studies showing how to trace and validate traffic paths through the lab.  
- Integration with monitoring/alerting tools for continuous security visibility.

## Author

Aniwat Samatiwat  
Cyber & Infrastructure Specialist – digital forensics, network forensics, VPN & zero‑trust architectures, and blockchain‑based asset tracing.

