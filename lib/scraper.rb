require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML.parse(open(index_url))
    students = doc.css(".student-card")
    students.each{ |s|
      f = {}
      f[:name] = s[:id].gsub("-", " ").split("card")[0].strip
      f[:location] = s.children[1].css("p")[0].children.text
      f[:profile_url] = s.css("a")[0]["href"]
    }
    result

  end

  def self.scrape_profile_page(profile_url)

  end

end
