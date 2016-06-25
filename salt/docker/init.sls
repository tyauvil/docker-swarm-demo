docker_repo:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb https://apt.dockerproject.org/repo ubuntu-xenial testing
    - dist: ubuntu-xenial
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 2C52609D
    - keyserver: p80.pool.sks-keyservers.net
    - require_in:
      - pkg: docker-engine

docker-engine:
  pkg.installed:
    - version: 1.12.0~rc2-0~xenial

  