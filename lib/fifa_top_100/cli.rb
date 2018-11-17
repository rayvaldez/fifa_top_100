class FifaTop100::CLI

  def call
    FifaTop100::Scraper.scrape_page
    @players = FifaTop100::Player.all
    puts ""
    puts "-----------------------------------------------"
    puts "      Welcome to the FifaTop100 CLI"
    puts "-----------------------------------------------"
    puts ""
    top_menu
  end

  def top_menu
    input = nil
    puts "What set of players would you like to see?"
    puts "1.10-1"
    puts "2.20-1"
    puts "3.50-1"
    puts "4.100-1"
    input = gets.strip.to_i

    list_players(input)

    puts ""
    puts "Select a player you would like more information on."
    input = gets.strip.to_i

    print_player(input)

    puts ""
    puts "Would you like to see another player? Enter Y or N"
    input = gets.strip.downcase

    if input == "y"
      top_menu
    elsif input == "n"
      goodbye
    else
      puts ""
      puts "Please type Y or N"
      top_menu
    end
  end

  def list_players(input)
    if input == 1
        @players.first(10).reverse.each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}"
        end
      elsif input == 2
        @players.first(20).reverse.each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}"
        end
      elsif input == 3
        @players.first(50).reverse.each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}"
        end
      elsif input == 4
        @players[0...100].each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}"
        end
      end
  end

  def print_player(input)
    if input > 0
      the_player = @players[input.to_i-1]
      puts "Name: #{the_player.name}"
      puts "Team: #{the_player.team}"
      puts "Rank: #{the_player.rank}"
      puts "#{the_player.description}"
    end
  end

  def goodbye
    puts ""
    puts "Goodbye!"
  end
end
