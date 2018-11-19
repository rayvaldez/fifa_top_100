class FifaTop100::CLI

  def call
    FifaTop100::Scraper.scrape_page
    @players = FifaTop100::Player.sort_all
    puts ""
    puts "----------------------------------------------------------"
    puts "          Welcome to the FifaTop100 CLI".colorize(:green)
    puts "----------------------------------------------------------"
    puts ""
    top_menu
  end

  def top_menu
    input = nil
    puts "Please choose from the following options:"
    puts ""
    puts "1.Top 10".colorize(:yellow)
    puts "2.Top 20".colorize(:yellow)
    puts "3.Top 50".colorize(:yellow)
    puts "4.Show all Players".colorize(:yellow)
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
      puts ""
      top_menu
    end
  end

  def list_players(input)
    puts ""
    if input == 1
        puts "-----------------------------------"
        puts "               Top 10".colorize(:green)
        puts "-----------------------------------"
        @players[1..10].each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}".colorize(:yellow)
        end
      elsif input == 2
        puts "-----------------------------------"
        puts "               Top 20".colorize(:green)
        puts "-----------------------------------"
        @players[1..20].each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}".colorize(:yellow)
        end
      elsif input == 3
        puts "-----------------------------------"
        puts "               Top 50".colorize(:green)
        puts "-----------------------------------"
        @players[1..50].each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}".colorize(:yellow)
        end
      elsif input == 4
        puts "-----------------------------------"
        puts "               Top 100".colorize(:green)
        puts "-----------------------------------"
        @players[1..100].each.with_index(1) do |player, index|
        puts "#{index}. #{player.name}".colorize(:yellow)
        end
      else
        puts ""
        puts "Please enter a valid option".colorize(:red)
        puts ""
        top_menu
      end
  end

  def print_player(input)
    if input > 0 && input < 101
      the_player = @players[input.to_i]
      puts "----------------------------------------------------------------------------------------"
      puts ""
      puts "Name: #{the_player.name}".colorize(:white)
      puts "Team: #{the_player.team}".colorize(:white)
      puts "Rank: #{the_player.rank}".colorize(:white)
      puts "#{the_player.description}".colorize(:white)
      puts ""
      puts "----------------------------------------------------------------------------------------"
    else
      puts "Please enter a valid option".colorize(:red)
      puts ""
      top_menu
    end
  end

  def goodbye
    puts ""
    puts "Goodbye!"
    puts ""
  end
end
