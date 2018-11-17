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

end
