### Linux Server Installation (LS-xx)
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
echo "yum install iptables-services"
yum -y install iptables-services
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
echo "hostnamectl set-hostname LS-xx.CSN4002234.com #static"
hostnamectl set-hostname LS-xx.CSN4002234.com #static

# Install tcpdump
echo "---------------------------------------------------" 
echo "yum install tcpdump"
yum -y install tcpdump

# Run yum update
echo "---------------------------------------------------" 
echo "yum update"
yum update -y
