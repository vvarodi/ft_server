docker build -t ft_server . 
docker run --name ft_server -d -p 8080:80 ft_server
