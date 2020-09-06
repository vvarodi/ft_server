#docker rm --force ft_server
docker stop ft_server
#docker rm ft_server
docker rm $(docker ps -qa)
docker system prune --force
#docker rmi $(docker images -a -q)