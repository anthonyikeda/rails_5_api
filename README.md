# Setup a master database environment

```
docker network create cloud-dev
docker volume create app-dev-data
docker volume create mysql-dev-data
docker run --rm --network=cloud-dev -d -p 18500:8500 --name consul-dev gliderlabs/consul-server -bootstrap
docker run --name mysql-dev -v mysql-dev-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-password -p 13306:3306 --network=cloud-dev mysql
```

Then configure your db instance and connect to it over the docker network

# Other
http://sourcey.com/building-the-prefect-rails-5-api-only-app/
