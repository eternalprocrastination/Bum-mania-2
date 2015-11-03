class World 

  def initialize
    @impl = []
    @day = 1
  end

  def add_bum(bum)
    @impl.push(bum)
  end

  def to_s 
    @impl.each{|bum| puts bum.to_s}
  end

  def time_passes
    @day += 1
    @impl.each{|bum| bum.next_turn}
    @impl.delete_if{|bum| bum.game_over?}
  end

  attr_reader :day
end