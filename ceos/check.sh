printf "\n"
printf "network list\n"
printf "============\n"
docker network list

printf "\n"
printf "image list\n"
printf "==========\n"
docker image list

printf "\n"
printf "container list\n"
printf "==============\n"
docker container ls -a

printf "\n"
printf "container logs\n"
printf "==============\n"
docker container ls -q | sed 's/^/docker container logs /' | sh | grep "User System"
