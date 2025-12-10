# External Resources & Further Reading

This lab builds on a number of excellent public resources and community discussions.  
The list below is a curated starting point for anyone who wants to go deeper.

## WireGuard, CGNAT & pfSense

- Guides on exposing services behind CGNAT using WireGuard and a VPS – concepts and iptables patterns similar to this lab.[gist.github+1]  
- Community threads on pfSense WireGuard packages, best practices for running WireGuard on pfSense, and handling CGNAT scenarios.[web:26][web:38][web:41]  
- Articles and blog posts explaining how to enable WireGuard on routers behind CGNAT and how to design the overlay addressing scheme safely.[web:31][web:39]  

## Official Documentation

- WireGuard official documentation (configuration syntax, key handling, AllowedIPs semantics).[web:34][web:22]  
- pfSense documentation for VPNs, interfaces, and firewall/NAT rule design.[web:28]  
- Oracle Cloud Infrastructure free‑tier documentation for networking, security lists, and compute instances.[web:27]  

## Tools & Downloads

Most lab components can be obtained directly from their official sources:

- **pfSense**: ISO and installation images from the Netgate website.  
- **WireGuard**: packages for Linux distributions (apt/yum), Windows client, mobile apps.  
- **Pi‑hole / AdGuard Home**: DNS filtering tools used in some variants of this lab.  
- **tcpdump / Wireshark**: packet‑capture tools for network‑forensics exercises.

> Note: This repository only includes **sanitised examples**.  
> For production or sensitive investigations, always download binaries from official vendors and follow their verification procedures.
