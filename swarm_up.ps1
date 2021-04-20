# Initialize Swarm
$join_command = (vagrant ssh docker-1 --command "docker swarm init || docker swarm join-token worker" | Select-String -Pattern "docker swarm join --token .*").Matches[0].Value
vagrant ssh docker-2 --command "$join_command"
vagrant ssh docker-3 --command "$join_command"
