docker-machine create manager  --engine-insecure-registry 192.168.99.1:5000  
docker-machine create agent1  --engine-insecure-registry 192.168.99.1:5000  
docker-machine create agent2  --engine-insecure-registry 192.168.99.1:5000  
docker-machine create agent3  --engine-insecure-registry 192.168.99.1:5000
eval `docker-machine env manager`
docker swarm init --advertise-addr `docker-machine ip manager`
docker-machine ssh agent1 docker swarm join --token `docker swarm join-token -q worker` `docker-machine ip manager`:2377
docker-machine ssh agent2 docker swarm join --token `docker swarm join-token -q worker` `docker-machine ip manager`:2377  
docker-machine ssh agent3 docker swarm join --token `docker swarm join-token -q worker` `docker-machine ip manager`:2377
docker node ls 
