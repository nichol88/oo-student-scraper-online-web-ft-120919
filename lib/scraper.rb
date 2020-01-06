require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML.parse(open(index_url))
    students = doc.css(".student-card")
    result = students.map{ |s|
      s[:name] = s[:id].gsub("-", " ").split("card")[0].strip
      s[:location] = s.children[1].css("p")[0].children.text
      s[:profile_url] = s.css("a")[0]["href"]
    }
    result
    
  end

  def self.scrape_profile_page(profile_url)

  end

end
