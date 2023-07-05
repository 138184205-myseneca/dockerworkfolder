# Use tee with sudo user permission to save changes
iptables-save | sudo tee /etc/sysconfig/iptables

# Restart iptables to make sure configuration is saved
systemctl restart iptables

# Check rules to make sure changes are saved
iptables -nvL