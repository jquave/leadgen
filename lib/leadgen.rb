require 'open-uri'
require 'JSON'
require 'base64'
require 'CSV'
require 'leadgen/base.rb'
require 'leadgen/kickstarter.rb'

class Leadgen < Thor

  def initialize
    @core = LeadgenCore.new
  end

  package_name "Leadgen"
  map "-L" => :list

  desc "dump", "Dump today's results"
  def dump
    puts "Dump..."
  end

  desc "list", "list all results"
  def list(search="")
    puts search
  end

  def self.version
    "0.0.2"
  end

  def self.kickstarter
    core = LeadgenCore.new

    csv_data = ["title", "raised", "state"].to_csv

    # Get first n pages of Kickstarter search results. 20 results per page
    n = 2
    (1..n).each do |page_num|
      uri = "https://www.kickstarter.com/projects/search.json?search=&page=#{page_num}&term="
  
      jsonStr = core.getJSONTextFromURI(uri)
      core.cache(uri, jsonStr)

      parsed = JSON.parse(jsonStr)
      ks = Kickstarter.new(parsed)
      csv_data += ks.csv
    end

    puts csv_data

    # Write CSV to disk
    File.write("./out/out.csv", csv_data)
  end

end

