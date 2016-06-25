zfs_packages:
  pkg.installed:
    - names:
      - zfs-dkms
      - zfsutils-linux

zdata:
  zpool.present:
    - config:
      import: false
      force: true
    - layout:
      zpool:
        /dev/sdb
 
 /var/lib/docker:
   zfs.volume_present:
     - create_parent: true
