require 'open-uri'
require 'JSON'
require 'base64'

require 'lib/base'

class Leadgen < Thor
  package_name "Leadgen"
  map "-L" => :list

  desc "dump", "Dump today's leads"
  def dump
    puts "Dump..."
  end

  desc "list", "list all sources of leads"
  def list(search="")
    puts search
  end

  def self.version
    "0.0.2"
  end

  def self.kickstarter
    lg = Leadgen.new
    uri = "https://www.kickstarter.com/projects/search.json?search=&term="
    jsonStr = lg.getJSONTextFromURI(uri)
    lg.cache(uri, jsonStr)
  end

end

