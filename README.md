# About

This docker image bundles the Go [migrate](https://github.com/mattes/migrate/) DB migration tool. Extending from this image, you can create one time run containers for running DB migrations for your project.

## How to use

Simple `Dockerfile` for using this image:

```
FROM wiztools/dbmigrate:3.0.1

COPY db/migrations/*.sql /app/db/migrations/
```

The version of the image is same as the release version of the [migrate](https://github.com/mattes/migrate/) tool.

When running the container, you need to pass:

1. DB URL `dburl` as environment variable.
2. The migrate command like `up` / `down` as parameter. When no parameter is given, by default `up` command is used.

Example:

```
$ docker build -t migrate .
$ docker run -e dburl='mysql://root@tcp(localhost:3306)/test' migrate up
```
