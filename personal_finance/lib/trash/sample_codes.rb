sample_codes.rb




class Arena
  attr_accessor :name, :gladiators, :winner, :loser

  def initialize name, gladiators = []
    @name = name.capitalize
    @gladiators = gladiators
    @winner = false
  end

  def list_gladiators
    if @gladiators.empty?
      puts "There ain't no gladiators."
    else
      puts "Introducing the gladiators:"
      @gladiators.each do |gladiator|
	puts "#{gladiator.name} wields a #{gladiator.weapon}."
      end
    end
  end

  def add_gladiator inputA = nil, inputB = nil
    case inputA
    when String
      birth_gladiator(Gladiator.new(inputA, inputB))
    when Gladiator
      birth_gladiator(inputA)
    when NilClass
      birth_gladiator(Gladiator.new)
    when Array
      inputA.each do |gladiator|
	birth_gladiator(gladiator)
      end
    else
      puts "I don't know how to birth gladiators from this."
    end
  end

  
  def birth_gladiator gladiator
    if @gladiators.count < 2
      @gladiators << gladiator
    else
      puts "You already have 2 gladiators!"
    end
  end

  def remove_gladiator name = nil
    if name == nil
      puts "Which gladiator do you want to dismiss?"
      name = gets.chomp.to_s.capitalize
    end
    index = 0
    num_gladiators = @gladiators.count
    while index < num_gladiators
      if @gladiators[index].name == name
	@gladiators.delete_at(index)
      end
      index += 1
    end
    if num_gladiators == @gladiators.count
      puts "#{name} isn't a gladiator!"
    end
  end