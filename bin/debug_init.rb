#! /usr/bin/env ruby

puts "debug_init installing bundle"

`bundle install`


`rdebug-ide ./bin/doodles.rb`

# `rdebug-ide ./bin/doodles.rb`
