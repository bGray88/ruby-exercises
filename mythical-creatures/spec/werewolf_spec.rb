require 'rspec'
require '../lib/werewolf'

RSpec.describe Werewolf do
  it 'has a name' do
    werewolf = Werewolf.new('David')
    expect(werewolf.name).to eq('David')
  end

  it 'has a location' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.location).to eq('London')
  end

  it 'is by default human' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true
  end

  it 'when starting as a human, changing makes it turn into a werewolf' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!
    expect(werewolf.wolf?).to be true
    expect(werewolf.human?).to be false
  end

  it 'when starting as a human, changing again makes it be human again' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true

    werewolf.change!

    expect(werewolf.human?).to be false

    werewolf.change!

    expect(werewolf.human?).to be true
  end

  it 'when starting as a werewolf, changing a second time makes it a werewolf' do
    werewolf = Werewolf.new('David', 'London')

    werewolf.change!
    expect(werewolf.wolf?).to be true

    werewolf.change!
    werewolf.change!

    expect(werewolf.wolf?).to be true
  end

  it 'is not hungry by default' do
    werewolf = Werewolf.new('David', 'London')

    expect(werewolf.is_hungry?).to be false
  end

  it 'becomes hungry after changing to a werewolf' do
    werewolf = Werewolf.new('David', 'London')
    
    werewolf.change!
    expect(werewolf.is_hungry?).to be true

    werewolf.change!
    expect(werewolf.is_hungry?).to be false
  end

  class Victim
    attr_accessor :status

    def initialize
      @status = :alive
    end

    def eaten
      @status = :dead
    end

    def is_alive?
      return @status
    end
  end

  it 'consumes a victim' do
    werewolf = Werewolf.new('David', 'London')
    human = Victim.new()

    werewolf.change!

    expect(werewolf.wolf?).to eq true
    expect(werewolf.is_hungry?).to eq true
    expect(werewolf.eat(human)).to eq "Yum!"
  end

  it 'cannot consume a victim if it is in human form' do
    werewolf = Werewolf.new('David', 'London')
    human = Victim.new()

    expect(werewolf.human?).to eq true
    expect(werewolf.is_hungry?).to eq false
    expect(werewolf.eat(human)).to eq "Yuck!"
    expect(werewolf.is_hungry?).to eq false
  end

  it 'a werewolf that has consumed a human being is no longer hungry' do
    werewolf = Werewolf.new('David', 'London')
    human = Victim.new()

    werewolf.change!

    expect(werewolf.wolf?).to eq true
    expect(werewolf.is_hungry?).to eq true
    expect(werewolf.eat(human)).to eq "Yum!"
    expect(werewolf.is_hungry?).to eq false
    expect(werewolf.eat(human)).to eq "Yuck!"
  end

  it 'a werewolf who has consumed a victim makes the victim dead' do
    werewolf = Werewolf.new('David', 'London')
    human = Victim.new()

    werewolf.change!

    expect(human.is_alive?).to eq :alive
    expect(werewolf.wolf?).to eq true
    expect(werewolf.is_hungry?).to eq true
    expect(werewolf.eat(human)).to eq "Yum!"
    expect(human.is_alive?).to eq :dead
  end

end
