### Linux Router Installation (LR-xx)
### run with sudo

# Remove the firewalld service
echo "---------------------------------------------------" 
echo "firewall-cmd --state"
firewall-cmd --state
echo "---------------------------------------------------"
echo "Do you wan to continue with firewall service removal? (yes/no)"
echo "---------------------------------------------------"

read -r answer
if [[ "$answer" != "yes" ]]; then
    exit 2
fi
echo "---------------------------------------------------"
echo "systemctl stop firewalld"
systemctl stop firewalld
echo "---------------------------------------------------" 
echo "systemctl disable firewalld"
systemctl disable firewalld
echo
echo
echo
echo "---------------------------------------------------" 
echo "press q to proceed to next command"
echo "---------------------------------------------------"
echo
echo
echo
echo "---------------------------------------------------" 
echo "systemctl status firewalld"
systemctl status firewalld
echo "---------------------------------------------------" 
echo "yum remove -y firewalld"
yum remove -y firewalld

# Install iptables services
echo "---------------------------------------------------" 
echo "yum install -y iptables-services"
yum install -y iptables-services
echo "---------------------------------------------------" 
echo "systemctl enable iptables"
systemctl enable iptables
echo "---------------------------------------------------" 
echo "systemctl iptables"
systemctl iptables

# Work with hostname
echo "---------------------------------------------------" 
echo "hostnamectl status"
hostnamectl status
echo "---------------------------------------------------" 
echo "hostnamectl set-hostname LR-xx.CSN4002234.com #static"
hostnamectl set-hostname LR-xx.CSN4002234.com #static

# Enable IPv4 forwarding
echo "---------------------------------------------------" 
echo "echo 1 | tee /proc/sys/net/ipv4/ip_forward"
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
echo "---------------------------------------------------" 
echo "cat /proc/sys/net/ipv4/ip_forward"
cat /proc/sys/net/ipv4/ip_forward

echo "---------------------------------------------------" 
echo "sudo sysctl -w net.ipv4.ip_forward=1"
sudo sysctl -w net.ipv4.ip_forward=1

# Install tcpdump
echo "---------------------------------------------------" 
echo "yum install tcpdump"
yum install -y tcpdump

# Run yum update
echo "---------------------------------------------------" 
echo "yum update"
yum update -y 
