# see https://github.com/saltstack-formulas/iptables-formula/blob/master/pillar.example
firewall:
  install: True
  enabled: True
  strict: True
  services:
    ssh:
      block_nomatch: True
      protos:
        - tcp
      ips_allow:
        - 192.168.0.0/16
        - 10.0.0.0/8
        
