	docker stop ceos3
	docker rm ceos3
	docker logs -n 10 ceos3 | grep Interface
