sudo su - stack -c "cd as-stack; make; cd devstack; ./stack.sh; \
sleep 3; sudo yum -y install jq; curl localhost/identity | jq"
