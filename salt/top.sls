base:
    '*':
        - core
        - docker
    'manager*':
        - docker.swarm_manager
    'worker*':
        - docker.swarm_worker
