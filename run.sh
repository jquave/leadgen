#/bin/sh

gem build leadgen.gemspec
gem install ./leadgen-0.0.2.gem
./test.rb
