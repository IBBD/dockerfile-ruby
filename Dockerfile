#
# Ruby Dockerfile
#
# https://github.com/ibbd/dockerfile-ruby
#
# sudo docker build -t ibbd/ruby ./
#

# Pull base image.
FROM ruby:2.2-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN mkdir -p /var/www

# sources.list
# git clone git@github.com:IBBD/docker-compose.git
# 如果导致apt-get Install不成功，可以先注释这句
#ADD ext/sources.list   /etc/apt/sources.list

# 注意：RubyGems镜像已经替换成了淘宝的，具体见：http://ruby.taobao.org/
RUN gem sources --remove https://rubygems.org/ \
    && gem sources -a https://ruby.taobao.org/ 

# install sass 前端开发需要
# @todo 以后可以分离出基础镜像
# sass:    http://sass-lang.com/documentation/file.SASS_REFERENCE.html
# compass: http://compass-style.org/install/
RUN gem install sass \
    && gem install compass

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"

