#!/bin/bash
# Example iptables rules on VPS to expose HTTPS from a server behind CGNAT.
# Public IP: 203.0.113.10 (mock)
# Internal server: 10.10.10.20 (behind pfSense, reachable via wg0)
# WG interface: wg0, public NIC: eth0

PUBLIC_IP="203.0.113.10"
WG_IF="wg0"
WAN_IF="eth0"
INTERNAL_SERVER="10.10.10.20"

# Default forward policy
iptables -P FORWARD DROP

# Allow established/related
iptables -A FORWARD -i "$WAN_IF" -o "$WG_IF" -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i "$WG_IF" -o "$WAN_IF" -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# HTTPS (443) example
iptables -A FORWARD -i "$WAN_IF" -o "$WG_IF" -p tcp --syn --dport 443 -m conntrack --ctstate NEW -j ACCEPT
iptables -t nat -A PREROUTING  -i "$WAN_IF" -p tcp --dport 443 -j DNAT --to-destination "${INTERNAL_SERVER}:443"
iptables -t nat -A POSTROUTING -o "$WG_IF" -p tcp --dport 443 -d "$INTERNAL_SERVER" -j SNAT --to-source 10.100.0.1
