#!/bin/bash

docker rm mod-brightness;
docker run -d --name mod-brightness --link redis:db --privileged mod-brightness;