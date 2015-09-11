#!/bin/bash

# 清除已有的
name=ruby
docker stop ibbd-$name 
docker rm ibbd-$name 
docker rmi ibbd/$name 

# 重新生成
docker build -t ibbd/$name ./

