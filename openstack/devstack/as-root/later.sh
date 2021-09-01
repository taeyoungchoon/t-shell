sudo su - stack -c "cd as-stack; make; cd devstack; ./stack.sh; sleep 3; curl localhost/identity | jq"
