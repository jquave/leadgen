require 'open-uri'
require 'JSON'
require 'base64'

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

  def cacheDir
    "./cache"
  end

  def cacheFilename(url)
    Base64.encode64 url
  end

  def cachePath(url)
    "#{cacheDir}/#{cacheFilename(url)}"
  end

  def cache(uri, str)
    File.write(cachePath(url), str)
  end

  def getJSONTextFromURI(uri)
    # Load the JSON from the specified URL
    if File.exists? cachePath(url)
      # Return the cached copy
      
    else
      open("https://www.kickstarter.com/projects/search.json?search=&term=")
    end
  end

end

