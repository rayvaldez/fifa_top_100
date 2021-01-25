class FifaTop100::Scraper

  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.ea.com/en-gb/games/fifa/fifa-19/ratings/fifa-19-player-ratings-top-100"))
    # binding.pry
    doc.css("ea-section-column")[1..205].each do |player|
      FifaTop100::Player.new ({
        team: player.css("h2").text,
        name: player.css("h3").text.split(" ").drop(1).join(" "),
        rank: player.css("h3").text.split(" ").first,
        description: player.css("p").text
      })
    end
  end
end
