class Kickstarter

  attr_accessor :projects

  def initialize(json)
    puts "Initializing Kickstarter with json..."
    @projects = json["projects"]
    puts "First project: #{@projects[0]}"
  end

  def self.csv_headers
    ["Title", "Pledged", "Goal", "State", "Location", "Backers", "Funded?"]
  end

  def csv
    csv_string = ""

    csv_lines = @projects.map { |p|
      cs = p["currency_symbol"]
      if cs == "$"
        pledged = p["usd_pledged"]
        goal = p["goal"]
        location = p["location"]["short_name"]
        backers = p["backers_count"]
        funded = pledged.to_f > goal.to_f
        [p["name"], "#{cs}#{pledged}", goal, p["state"], location, backers, funded].to_csv
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
