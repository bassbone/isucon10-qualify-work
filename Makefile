build:
	docker-compose build

up: build
	docker-compose up -d

test: up
	docker-compose exec app ruby -cw lib/isucari/web.rb
	docker-compose exec app ruby -cw lib/isucari/api.rb
	docker-compose exec app ruby test.rb

push: test
	git push origin master
