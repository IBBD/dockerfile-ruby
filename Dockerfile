#
# Ruby Dockerfile
#
# https://github.com/ibbd/dockerfile-ruby
#
# sudo docker build -t ibbd/ruby ./
#

# Pull base image.
FROM ruby:2.2-slim
#FROM ruby:2.2

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN mkdir -p /var/www

# sources.list
# git clone git@github.com:IBBD/docker-compose.git
# 如果导致apt-get Install不成功，可以先注释这句
ADD ext/sources.list   /etc/apt/sources.list

# 注意：RubyGems镜像已经替换成了淘宝的，具体见：http://ruby.taobao.org/
RUN gem sources --remove https://rubygems.org/ \
    && gem sources -a https://ruby.taobao.org/ 


# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"

