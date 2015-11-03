class Bum
  @@id = 0

  def initialize(name, patronym)
    @bum_id = @@id.tap{@@id += 1}
    @health = 100
    @money = rand(100..200)
    @addiction = rand(10..20)
    @hunger = 0
    @name = name
    @patronym = patronym
  end

  def to_s
    "#{bum_id}. #{name} #{patronym}: #{health} HP, #{money} ₽, алкоголизм — #{addiction}%"
  end

  def next_turn
    buy(200) {@health = 100} if @health < 70
    buy(50) {@hunger = 0} if @hunger > 60
    buy(30) {@addiction += rand(7..10)}
    buy(250) {@addiction = rand(0..15)} if @addiction > 70
    @money += rand(50..120)
    @health -= rand(18..33) if rand() > 0.6
    @hunger -= rand(18..25)
  end

  def fight(other)
    if other == self
      @health -= rand(15..25)
    else
      @health -= rand(25..33)
      other.health -= rand(25..33)
    end

  def buy(sum, &x)
    if sum <= @money
      @money -= sum
      x.()
    else
      return "BABLA NYET"
    end
  end

  def game_over?
    true if @health == 0 or @money >= 6000 or @addiction > 100 or @hunger > 100
  end

  attr_reader :bum_id, :name, :patronym, :money, :addiction
  attr_accessor :health
end
