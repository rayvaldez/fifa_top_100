class FifaTop100::Player
  attr_writer :player
  attr_accessor :name, :rank, :team, :description
  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      if (value != "") && (value != nil)
        self.send("#{key}=", value)
      end
    end
    if self.rank != nil
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.sort_all
    @@all.reject { |player| player.rank.nil? }
    @@all.sort! { |a, b| a.rank.to_i <=> b.rank.to_i }
  end

end
