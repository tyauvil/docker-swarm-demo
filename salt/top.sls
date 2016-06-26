base:
    'manager*':
        - core
        - docker
        - docker.swarm_manager
    'worker*':
        - core
        - docker
        - docker.swarm_worker
    'ceph*':
        - ceph