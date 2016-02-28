== AntMan Suit

It is a simple API to short URLs written using [Grape](https://github.com/intridea/grape) with Rails, becouse I couldn't finish [that](https://github.com/cadicallegari/grape-goliath-boilerplate).

## Run

That project is Docker ready, but you will need [docker-compose](https://docs.docker.com/compose) too.


After download/clone the project, you will need build a docker container

> docker-compose build


Then you should create database and run migrations

> docker-compose run app rake db:create
> docker-compose run app rake db:migrate


So you can run the app and access it throw the port 3000

> docker-compose run app


To run rspec be sure that you have your test database ready with

> docker-compose run test rake db:test:prepare


If it is all set just run

> docker-compose run test

## License
[MIT ©](https://github.com/cadicallegari/antman-suit/blob/master/LICENSE)
