docker run -d --name=redis redis

docker run -d --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres

docker run -d --name=vote -p 5000:80 --link redis:redis pavany77/voting_app:v1

docker run -d --name=result -p 5001:80 --link db:db pavany77/result_app:v1

docker run -d --name=worker --link db:db --link redis:redis pavany77/worker:v1