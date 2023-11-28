# example-voting-app

  this is a fork of https://github.com/dockersamples/example-voting-app

This application encompasses three microservices along with a PostgreSQL database and a Redis cache store. 

This guide demonstrates the setup by ensuring seamless connectivity between these services. 
Additionally, it ensures accessibility for users to interact with our voting and result portals.


### Prerequisites

Make sure you have Docker installed on your machine. You can download and install Docker from [Docker's official website](https://www.docker.com/get-started).

## Running Services using docker

### Start the Redis container named 'redis'
docker run -d --name=redis redis

### Start the Postgres container named 'db' with trust authentication
docker run -d --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres

### Start the Voting App container named 'vote'
docker run -d --name=vote -p 5000:80 --link redis:redis pavany77/voting_app:v1

### Start the Result App container named 'result'
docker run -d --name=result -p 5001:80 --link db:db pavany77/result_app:v1

### Start the Worker container named 'worker' linking both db and redis containers
docker run -d --name=worker --link db:db --link redis:redis pavany77/worker:v1



## Accessing Services
  - The Voting App can be accessed at http://localhost:5000
  - The Result App can be accessed at http://localhost:5001


### Kubernetes Deployment

  - Required manifest files for this app are available [here](https://github.com/Pavan-Y/example-voting-app/tree/main/k8s_deploy)

  
  Status of the application:


    ![deployment_status](https://github.com/Pavan-Y/example-voting-app/blob/main/docs/k8s_deployment_status.png)