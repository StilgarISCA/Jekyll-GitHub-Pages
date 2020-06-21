FROM ubuntu:20.04

# Expose the Jekyll server port
EXPOSE 4000

# Configure bash shell
SHELL ["/bin/bash", "-l", "-c"]

ENV RUBY_VERSION 2.7.1

# Update/Install packages
RUN apt-get -y update
RUN apt-get -y install gcc
RUN apt-get -y install make
RUN apt-get -y install build-essential
RUN apt-get -y install patch
RUN apt-get -y install liblzma-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install libcurl4-gnutls-dev

# Remove default version of Ruby
RUN apt-get -y --purge remove ruby
RUN rm -rf /usr/share/ruby-rvm /etc/rvmrc /etc/profile.d/rvm.sh

# Install Ruby via RVM
RUN apt-get -y install curl
RUN apt-get -y install gnupg2
RUN command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby=${RUBY_VERSION} --autolibs=enable --auto-dotfiles
RUN source /usr/local/rvm/scripts/rvm
RUN echo 'source /usr/local/rvm/scripts/rvm' >> /root/.bashrc

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

# Add common commands to bash history
SHELL ["/bin/bash", "-i", "-c"]
RUN history -s 'bundle install'
RUN history -s 'bundle update'
RUN history -s 'bundle exec jekyll serve --drafts --watch --force_polling -H 0.0.0.0'

#EOF
