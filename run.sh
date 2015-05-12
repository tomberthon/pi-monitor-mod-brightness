#!/bin/bash

docker run -ti --link redis:db --privileged mod-brightness;