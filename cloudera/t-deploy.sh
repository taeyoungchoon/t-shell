# tar cvf - bin | ssh 172.20.99.120 "tar xvf -"
cat t-deploy.sh | ssh 172.20.99.120 "cat > t-deploy.sh"
#tar cvf - t-shell/cloudera/tools | ssh 172.20.99.120 "tar xvf -"
#ln -s t-shell/cloudera/tools bin
