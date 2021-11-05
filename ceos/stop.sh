docker container stop $(docker container ls -a -f "name=ceos[0-9]" -q)
docker container rm   $(docker container ls -a -f "name=ceos[0-9]" -q)
docker network   rm   $(docker network   ls    -f "name=net[0-9]"  -q)
