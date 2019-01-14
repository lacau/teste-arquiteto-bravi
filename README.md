# Example application #

A simple Spring Boot application that sports a REST API and does persistence using JPA.

This project is based on Spring Boot's [HATEOAS example](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-hateoas).

# Project structure
- **sample.hateoas.domain**: Entities and jpa reporitories
- **sample.hateoas.web**: Controllers and swagger configuration
- **sample.hateoas**: Spring boot application entry point

- Additional
  - **build-local-docker.sh**: script to build, tag and remove old docker images
  - **create-local-swarm-cluster**: script to create a swarm cluster and run swarm visualizer instance to cluster monitor
  - **run-local-docker**: script to replace docker-compose.yml image name with current build and deploy application to swarm cluster

# Running tests

1. Enter project root
2. Run ``mvn clean install``

# Setting up local environment

1. Enter project root
2. Run ``./build-local-docker.sh``
3. Run ``./create-local-swarm-cluster.sh``
4. Run ``./run-local-docker.sh``

You may need to set scripts permission to be **executable**, it can be done by:
1. Run ``chmod +x build-local-docker.sh``
2. Run ``chmod +x create-local-swarm-cluster.sh``
3. Run ``chmod +x run-local-docker.sh``

# Monitoring swarm cluster and access swagger docs

Open your browser and go to *http://localhost:8000/* for swarm cluster monitoring

Open your browser and go to *http://localhost:8090/swagger-ui.html* to access swagger docs

# Troubleshooting

1. You may need to access 127.0.0.1 instead of localhost depending on your loopback config
2. If you have **more than one** network intefaces, docker deamon **can't** automaticaly choose it on swarm init, so you should:
  - Open create-local-swarm-cluster.sh file and **add** "--advertise-addr \<ip address\>" to **"docker swarm init"** command on **line 7**
