core_packages:
  pkg.installed:
    - names:
      - apt-transport-https
      - ca-certificates

manager-1:
  host.present:
    - ip: 192.168.50.10

worker-1:
  host.present:
    - ip: 192.168.50.11

worker-2:
  host.present:
    - ip: 192.168.50.12

ceph-1:
  host.present:
    - ip: 192.168.50.13
