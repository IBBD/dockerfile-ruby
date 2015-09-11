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

# ruby-dev: 安装compass需要
#RUN apt-get update \
    #&& apt-get install -y ruby-dev \
    #&& rm -rf /var/lib/apt/lists/* 

# install sass 前端开发需要
# @todo 以后可以分离出基础镜像
# sass:    http://sass-lang.com/documentation/file.SASS_REFERENCE.html
RUN gem update --system \
    && gem install sass 

# compass: http://compass-style.org/install/
RUN buildDeps=' \
        autoconf \
        bison \
        gcc \
        libbz2-dev \
        libgdbm-dev \
        libglib2.0-dev \
        libncurses-dev \
        libreadline-dev \
        libxml2-dev \
        libxslt-dev \
        make \
        ruby \
        ' \
    && set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && gem install compass \
    && apt-get purge -y --auto-remove $buildDeps

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"

