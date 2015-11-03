require "bum"
require "array"
require "world"
require "console_utils"

def random_bum
  female_names = %w(Ирина Анастасия Юлия Екатерина Наталия)
  female_patronyms = %w(Васильевна Михайловна Петровна Ивановна Сергеевна Андреевна Александровна)
  
  male_names = %w(Лаврентий Сергей Андрей Александр Петр Иван Михаил Василий)
  male_patronyms = %w(Тимофеевич Васильевич Михайлович Петрович Иванович Сергеевич Андреевич Александрович)
  if rand() >= 0.5
    Bum.new(female_names.at_rand, female_patronyms.at_rand)
  else
    Bum.new(male_names.at_rand, male_patronyms.at_rand)
  end
end

world = World.new
10.times do
  world.add_bum(random_bum)
end

loop do
  puts "День #{world.day}:" 
  set_cursor_at(0, 0)
  print "\e[J"
  world.to_s
  puts "ПРЕСС ЭНТЫР"
  gets
  world.time_passes
  world.add_bum(random_bum) if rand() > 0.7
end
