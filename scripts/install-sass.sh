#!/usr/bin/env bash

# ruby
ruby -v > /dev/null 2>&1
RUBY_IS_INSTALLED=$?

if [ $RUBY_IS_INSTALLED -eq 0 ]; then
    echo "================# Ruby already installed"
else
    wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
    tar -xzvf ruby-2.2.3.tar.gz
    cd ruby-2.2.3/
    ./configure
    make
    make install
fi

# sass
gem install sass
