class FifaTop100::Player
  attr_accessor :name, :rank, :team, :description
  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.sort_all
    @@all.sort! { |a, b| a.rank.to_i <=> b.rank.to_i }
  end

end
