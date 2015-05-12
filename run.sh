#!/bin/bash

docker run -d --name mod-brightness --link redis:db --privileged mod-brightness;