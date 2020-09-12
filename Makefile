build:
	docker-compose build

up: build
	docker-compose up -d

test: up
	docker-compose exec app ruby -cw app.rb
	#docker-compose exec app ruby test.rb

push: test
	git push origin master

port:
	ssh -L localhost:8080:10.160.62.101:80 web3

mysqlcli:
	docker-compose exec mysql mysql -uisucon -pisucon isuumo
