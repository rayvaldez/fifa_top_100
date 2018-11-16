class FifaTop100::Player
  attr_accessor :name, :rank, :team, :description
  @@all = []

  def initialize(name)
    @@all << self
  end

end
