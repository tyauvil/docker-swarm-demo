swarm_init:
  cmd.run:
    - name: docker swarm init --listen-addr 192.168.50.10:2377
    - creates: /tmp/swarm_init 
