FROM ubuntu:bionic

# Expose the Jekyll server port
EXPOSE 4000

# Update/Install packages
RUN apt-get -y update
RUN apt-get -y install ruby
RUN apt-get -y install ruby-dev
RUN apt-get -y install gcc
RUN apt-get -y install make
RUN apt-get -y install build-essential
RUN apt-get -y install patch
RUN apt-get -y install liblzma-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install libcurl4-gnutls-dev

# Install Gems
RUN gem pristine rake
RUN gem update --system
RUN gem install jekyll
RUN gem install bundler

# Set the locale
RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
