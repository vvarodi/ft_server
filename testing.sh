#docker build -t ft_server . --build-arg autoindex=off
docker build -t ft_server . 
docker run --name ft_server -d -p 8080:80 -p 443:443 ft_server
#docker run --env autoindex=off --name ft_server -d -p 443:443 -p 80:80 ft_server