#!/bin/bash
docker stop ft_server
docker run --rm --env AUTOINDEX=on --name ft_server -d -p 443:443 -p 80:80 ft_server