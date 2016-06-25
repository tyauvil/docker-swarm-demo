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
        mirror-0:
          /dev/sdb
          /dev/sdc

zdata/docker:
  zfs.filesystem_present:
    - create_parent: true  