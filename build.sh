#!/usr/bin/env bash
docker pull ubuntu:jammy && docker build --no-cache --tag jaroslavtyc/drd.info:latest . && docker push jaroslavtyc/drd.info:latest

