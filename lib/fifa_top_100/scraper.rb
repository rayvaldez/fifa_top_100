require 'open-uri'
require 'nokogiri'
require 'pry'

class FifaTop100::Scraper

  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.easports.com/fifa/ratings/fifa-19-player-ratings-top-100"))
    doc.css(".eas-media").each do |player|
      FifaTop100::Player.new ({
        team: player.css(".eas-l1").text,
        name: player.css(".eas-d4").text.split(" ").drop(1).join(" "),
        rank: player.css(".eas-d4").text.split(" ").first,
        description: player.css(".eas-b3").text
      })
    end
  end
end
