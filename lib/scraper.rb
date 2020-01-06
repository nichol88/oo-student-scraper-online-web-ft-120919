require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML.parse(open(index_url))
    students = doc.css(".student-card")
    result = []
    students.each{ |s|
      f = {}
      f[:name] = s.children[1].css(".student-name").text
      f[:location] = s.children[1].css("p")[0].children.text
      f[:profile_url] = s.css("a")[0]["href"]
      result.push(f)
    }
    #binding.pry
    result
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML.parse(open(profile_url))
    socials = doc.css(".social-icon-container a")
    socials.each{ |link|
      link[:href]
    }

    binding.pry
  end

end
