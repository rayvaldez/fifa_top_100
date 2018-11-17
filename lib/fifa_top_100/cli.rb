class FifaTop100::CLI

  def call
    FifaTop100::Scraper.scrape_page
    puts ""
    puts "-----------------------------------------------"
    puts "      Welcome to the FifaTop100 CLI"
    puts "-----------------------------------------------"
    puts ""
    menu
  end

  def menu
    FifaTop100::Player.all[0...100].each.with_index(1) do |player,index|
      puts "#{index}. #{player.name}"
    end
    puts "For more information on a player, select the number next to the player"
  end
end

#def print_players(from_number)
#
#
#
#
#
#
#
