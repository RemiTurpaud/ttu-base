FROM fedora:26
MAINTAINER Rémi T

#Update system
RUN dnf -y install python3-devel findutils libstdc++
RUN dnf -y update python3-setuptools python3-pip

#Install Teradata python package
RUN pip3 install --no-cache-dir \
	teradatasql

#Install Teradata Tools & Utilities
ADD TeradataToolsAndUtilitiesBase__linux_*.tar tmp/
ADD ttu.repo /etc/yum.repos.d/ttu.repo
RUN cd tmp; find . -name '*.tar.gz' -exec tar zxvf {} --strip=1 \;
RUN dnf -y install bteq fastexp fastld mload

#Install TPT (manual, not in the above repo)
RUN cd /tmp/TeradataToolsAndUtilitiesBase/Linux/i386-x8664/; \
	rpm -ivh tptbase/*.rpm

#Add entry point - example
#ENTRYPOINT [ "bteq" ]
