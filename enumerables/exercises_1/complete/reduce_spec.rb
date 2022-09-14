RSpec.describe 'reduce' do

  it 'sums a list of numbers' do
    numbers = [32, 1, 21, 5, 81, 333]
    result = numbers.reduce(0) do |sum, number|
      sum + number
    end
    expect(result).to eq(473)
  end

  it 'subtracts a list of numbers' do
    numbers = [28, 12, 38, 1, 91]
    result = numbers.reduce(0) do |difference, number|
      difference - number
    end
    expect(result).to eq(-170)
  end

  it 'multiplies a list of numbers' do
    numbers = [2, 3, 5, 7]
    result = numbers.reduce(1) do |product, number|
      product * number
    end
    expect(result).to eq(210)
  end

  it 'capitalize key words in phrase' do
    keywords = ["fish", "blue"]
    phrase = 'one fish two fish red fish blue fish'
    result = phrase.split.reduce("") do |list, word|
      upcase = false
      keywords.each {|key| upcase = true if word == key}
      upcase == false ? list.to_s << word + " " : list.to_s << word.upcase + " "
    end
    result.rstrip!
    expect(result).to eq('one FISH two FISH red FISH BLUE FISH')
  end

  it 'divides 560 by a bunch of numbers' do
    numbers = [2, 2, 2, 5, 7]
    result = numbers.reduce(560) do |quotient, number|
      quotient / number
    end
    expect(result).to eq(2)
  end

  it 'subtract smallest values from 100' do
    elements = [[8, 5, 3], [1, 9, 11], [4, 7, 2], [19, 34, 6]]
    result = elements.reduce(100) do |difference, element|
      difference - element.min
    end
    expect(result).to eq(88)
  end

  it 'adds all second values together' do
    elements = [["a", 1], ["b", 9], ["c", 21]]
    result = elements.reduce(0) do |sum, element|
      sum + element[1]
    end
    expect(result).to eq(31)
  end
end

