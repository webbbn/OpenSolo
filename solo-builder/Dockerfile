# Latest Ubuntu 14.04LTS

FROM ubuntu:trusty

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6AF0E1940624A220
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6D1D8367A3421AFB
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BB92C09DB82666C
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E601AAF9486D3664

RUN apt-get update && apt-get install --no-install-recommends -y software-properties-common python-dev libffi* diffstat gawk chrpath wget texinfo sudo groff

RUN apt-add-repository 'deb http://ppa.launchpad.net/anatol/tup/ubuntu precise main' -y
RUN add-apt-repository 'ppa:terry.guo/gcc-arm-embedded' -y

RUN apt-get --assume-yes update
RUN apt-get --assume-yes install tup freetype* python-pip python-dev gcc-arm-none-eabi git
RUN apt-get --assume-yes install libffi*

RUN ssh-keyscan -t rsa github.com
RUN ssh-keyscan -t rsa bitbucket.org
RUN mkdir /vagrant

# Create the vagrant user to run the build script from
RUN useradd -m vagrant && echo "vagrant:vagrant" | chpasswd && adduser vagrant sudo
RUN mkdir -p /home/vagrant && chown -R vagrant:vagrant /home/vagrant
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER vagrant
WORKDIR /vagrant/solo-build
CMD ./buildall
