#!/bin/sh

migrate -version
migrate -source file://db/migrations -database "$dburl" "$@"
