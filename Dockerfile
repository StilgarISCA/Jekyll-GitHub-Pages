FROM ubuntu:bionic

# Expose the Jekyll server port
EXPOSE 4000

# Update/Install packages
RUN apt-get -y update
RUN apt-get -y install ruby2.5
RUN apt-get -y install ruby2.5-dev
RUN apt-get -y install gcc
RUN apt-get -y install make
RUN apt-get -y install build-essential
RUN apt-get -y install patch
RUN apt-get -y install liblzma-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install libcurl4-gnutls-dev

# Install Gems
RUN gem2.5 pristine rake
RUN gem2.5 update --system
RUN gem2.5 install jekyll
RUN gem2.5 install bundler

# Set the locale
RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
