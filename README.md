# Teradata Tools & Utilities Docker image
Docker image containing the essential Teradata Tools and Utilities as well as Python and the [Teradata SQL Driver for Python](https://pypi.org/project/teradatasql/).

## Image build
* Clone or Download this repository.
* Download the [Teradata Tools and Utilities - Linux Installation Packag](http://downloads.teradata.com/download/tools/teradata-tools-and-utilities-linux-installation-package-0) (you will need to register and accept the licence terms). And place the tar.gz file in this directory.
* Navigate to this directory and build the Docker image:

`docker build -t ttu-base .`

## Getting started
* Build a base image, as stated above.
* Use it directly. E.g. `docker run -it ttu-base bteq`
* Or expand use it to construct a new docker E.g.
  ```
  Dockerfile < FROM ttu-base
  Dockerfile < ENTRYPOINT [ "bteq" ]
  docker build -t bteq .
  docker run -i bteq < my.sql 2>&1
  ```
