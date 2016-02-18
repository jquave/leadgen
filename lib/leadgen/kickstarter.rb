class Kickstarter

  attr_accessor :projects

  def initialize(json)
    puts "Initializing Kickstarter with json..."
    @projects = json["projects"]
    puts "First project: #{@projects[0]}"
  end

  def csv_headers
    ["title", "raised", "state"]
  end

  def csv
    csv_string = ""

    csv_lines = @projects.map { |p|
      cs = p["currency_symbol"]
      if cs == "$"
        pledged = p["usd_pledged"]
        [p["name"], "#{cs}#{pledged}", p["state"]].to_csv
      else
        nil
      end
    }.reject { |r| r == nil }

    csv_lines.each do |line|
      csv_string << "#{line}"
    end

    csv_string
  end

end
