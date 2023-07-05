# Configuration & Debugging Cheat-sheet

## Linux Router Installation (LR-xx)

Check the script [./lr_setup.sh](./lr_setup.sh)

## Linux Server Installation (LS-xx)

Check the script [./ls_setup.sh](./ls_setup.sh)

## Working with Linux Firewalls

Check Firewall Settings

```bash
sudo iptables -nvL --line-numbers
```

Syntax to Insert rule, which would be above the existing

```bash
sudo iptables -I <CHAIN> <rule-number> firewall-rule
```

View all `iptables` rules

```bash
sudo iptables -t filter -L <CHAIN> --line-numbers -n -v
```

Insert a rule at a specific rule with line number

```bash
suo iptables -I <CHAIN> <rule-number> -p <protocol> -m <state> --dport <port no> -j <ACTION>
```

Drop chain FORWARD with line number

```bash
sudo iptables -D FORWARD <rule-number>
```

Capture traffic to log file

```bash
sudo iptables -I FORWARD -p all -m limit --limit 10/s -j LOG  --log-prefix "DROPPING..."

# Where to find the logs from `LOG` chain
cat /var/log/messages
```

Add watch and `alias` to allow continuous monitoring of firewalls

```bash
alias ip="watch -n 1 'sudo iptables -nvL --line-number'" 
```

## Make sure Firewall settings will persist

Check the script [./save_iptables.sh](./save_iptables.sh)

## Working with `tcpdump` utility

```bash
# Look for Server Traffic in Router VM
sudo tcpdump -i any -qnns 0 host 172.17.xxx.37
```
