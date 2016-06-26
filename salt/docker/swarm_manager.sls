swarm_init:
  cmd.run:
    - name: docker swarm init --listen-addr 192.168.50.10:2377
    - unless: docker node ls | grep -q $HOSTNAME
