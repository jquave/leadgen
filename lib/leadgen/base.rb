class LeadgenCore

  def initialize
    puts "Created LeadgenCore"
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
    File.write(cachePath(uri), str)
    puts "Cached #{uri}"
  end
 
  def getJSONTextFromURI(uri)
    # Load the JSON from the specified URL
    contents = ""
    if File.exists? cachePath(uri)
      # Return the cached copy
      puts "Returning cached copy"
      File.open(cachePath(uri), "r") {|f|
        contents = contents + f.read
      }
    else
      contents = open(uri).read
      # Return parsed JSON
      puts "Retrieving from web"
    end
    contents
  end

end
