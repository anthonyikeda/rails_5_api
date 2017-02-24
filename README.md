# Setup a master database environment

```
docker network create cloud-dev
docker run --name mysql-dev -v /Users/anthonyikeda/Datastore/mysql-dev:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-password -p 13306:3306 --network=cloud-dev mysql 

```

Then configure your db instance and connect to it over the docker network


