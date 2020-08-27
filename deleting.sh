docker rm --force ft_server
docker rm $(docker ps -qa)
docker system prune 