# Ruby For IBBD

前期主要给前端开发使用，编译sass需要ruby环境 

- 基础镜像：`ruby:2.2-slim`

## 扩展说明

这两个组件主要是为前端开发做准备的：

- sass 
- compass

## 问题说明

### 使用 `ruby2.2-slim` 的基础镜像，在安装compass时报错：

```
ERROR: Failed to build gem native extension.
```

安装网上说的 `apt-get install ruby-dev` 也无法解决。

改用 `ruby2.2` 为基础镜像之后，安装成功：

```
Successfully installed ffi-1.9.10
Successfully installed rb-inotify-0.9.5
Successfully installed rb-fsevent-0.9.6
Successfully installed compass-import-once-1.0.5
Successfully installed multi_json-1.11.2
Successfully installed compass-core-1.0.3
Successfully installed chunky_png-1.3.4
    Compass is charityware. If you love it, please donate on our behalf at http://umdf.org/compass Thanks!
    Successfully installed compass-1.0.3
```

但是安装完成之后，镜像大小达到751MB，这个有点大。除去compass还有727MB，对比使用`ruby2.2-slim`时只有295MB。

*解决办法* : 加上相关的依赖即可，如下：

```
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
```




