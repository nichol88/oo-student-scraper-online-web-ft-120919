require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML.parse(open(index_url))
    students = doc.css(".student-card")
    students.map{ |s|

    }

    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
