#!/bin/bash

docker kill mod-brightness;
docker rm mod-brightness;
docker run -d --name mod-brightness --link redis:db --privileged mod-brightness;