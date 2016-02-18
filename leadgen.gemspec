# coding: utf-8
lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require "leadgen/version"

Gem::Specification.new do |spec|
  spec.add_development_dependency "bundler", "~> 1.0"
  spec.authors = ["Jameson Quave"]
  spec.description = "Leadgen is a command-line utility for scraping, parsing, and formatting lead sources."
  spec.email = "jquave@gmail.com"
#  spec.files = ["lib/leadgen.rb", "lib/leadgen/base.rb"]
  spec.files = Dir["lib/**/*"] + %w( README.md )
  spec.homepage = "http://jamesonquave.com/"
  spec.licenses = %w[MIT]
  spec.name = "leadgen"
  spec.require_paths = %w[lib]
  spec.required_ruby_version = '>= 2.2.2'
  spec.required_rubygems_version = ">= 2.4.8"
  spec.summary = spec.description
  spec.version = "0.0.2"
end
