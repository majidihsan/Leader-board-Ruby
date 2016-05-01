class Team
  attr_accessor :rank, :wins, :losses, :name
  def initialize(name)
    @name = name
    @rank = nil
    @wins = 0
    @losses = 0
  end
end
