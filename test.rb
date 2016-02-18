#!/usr/bin/env ruby

require 'thor'
require './lib/leadgen.rb'

puts "Leadgen: #{Leadgen.version}"

puts "Loading Kickstarter..."

Leadgen.kickstarter
