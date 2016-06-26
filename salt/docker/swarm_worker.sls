swarm_join:
  cmd.run:
    - name: docker swarm join 192.168.50.10:2377
    - creates: /tmp/swarm_join