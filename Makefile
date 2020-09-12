build:
	docker-compose build

up: build
	docker-compose up -d

test: up
	docker-compose exec app ruby -cw app.rb
	#docker-compose exec app ruby test.rb

push: test
	git push origin master
