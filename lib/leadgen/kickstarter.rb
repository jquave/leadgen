class Kickstarter

  attr_accessor :projects

  def initialize(json)
    puts "Initializing Kickstarter with json..."
    @projects = json["projects"]
    puts "First project: #{@projects[0]}"
  end

  def csv
    csv_string = ""
    #csv_string << ["title", "raised", "state"].to_csv

    csv_lines = @projects.map { |p|
      cs = p["currency_symbol"]
      pledged = p["usd_pledged"]
      [p["name"], "#{cs}#{pledged}", p["state"]].to_csv
    }

    csv_lines.each do |line|
      if line != nil
        csv_string << "#{line}"
      end
    end

    csv_string
  end

end
