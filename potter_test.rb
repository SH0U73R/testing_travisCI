require "minitest/autorun"
require './potter'

class Test_Potter < Minitest::Test
  def setup
    @potter = Potter.new
  end

  def test_basics
    assert_equal(0, @potter.price([]))
    assert_equal(8, @potter.price({b1: 1}))
    assert_equal(8, @potter.price({b2: 1}))
    assert_equal(8, @potter.price({b3: 1}))
    assert_equal(8, @potter.price({b4: 1}))
    assert_equal(8, @potter.price({b5: 1}))

    assert_equal(8 * 2, @potter.price({b1: 2, b2: 0, b3: 0, b4: 0, b5: 0}))
    assert_equal(8 * 3, @potter.price({b1: 0, b2: 3, b3: 0, b4: 0, b5: 0}))
  end

  def test_simple_discounts
    assert_equal(8 * 2 * 0.95, @potter.price({b1: 1, b2: 1, b3: 0, b4: 0, b5: 0})) #15.2
    assert_equal(8 * 3 * 0.90, @potter.price({b1: 1, b2: 1, b3: 1, b4: 0, b5: 0})) #21.6
    assert_equal(8 * 4 * 0.80, @potter.price({b1: 1, b2: 1, b3: 1, b4: 1, b5: 0})) #25.6
    assert_equal(8 * 5 * 0.75, @potter.price({b1: 1, b2: 1, b3: 1, b4: 1, b5: 1})) #30.0

  end

  def test_several_discounts
    assert_equal(8 + (8 * 2 * 0.95), @potter.price({b1: 2, b2: 1, b3: 0, b4: 0, b5: 0})) #23.2
    assert_equal(2 * (8 * 2 * 0.95), @potter.price({b1: 2, b2: 2, b3: 0, b4: 0, b5: 0})) #30.4
    assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), @potter.price({b1: 2, b2: 1, b3: 2, b4: 1, b5: 0})) #40.8
    assert_equal(8 + (8 * 5 * 0.75), @potter.price({b1: 1, b2: 2, b3: 1, b4: 1, b5: 1})) #38
  end

  def test_edge_cases
    #assert_equal(2 * (8 * 4 * 0.80), @potter.price({b1: 2, b2: 2, b3: 2, b4: 1, b5: 1}))
    #assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
    #@potter.price({b1: 5, b2: 5, b3: 4, b4: 5, b5: 4}))
  end

end

def best_disscount(count)
  #First, take out the full quantity if books (We already know that they are different books)
  max_set = count.inject {|sum, x| sum + x}
  #Then find out if we can make some even distribution
  if max_set.even?
    newset = Array.new(4)
    newset = newset.map { |p| 2 }    
  else
    puts "Not even :D"
  end
end

#2.- [5, 5, 5, 4, 4]      :> 4 sets de cinco y 1 de dos 
#    [5, 5, 5] + [4, 4]   :> 3 sets de cinco y 2 de cuatro

=begin
1.- [2, 2, 2, 1, 1], 5 * 8 * 0.90 + 8
    [2, 2, 2, 2, 0]


2.- [5, 5, 4, 5, 4]
    [5, 5, 5, 4, 4]

end
#First iteration
b1: 2, b2: 2, b3: 2, b4: 1, b5: 1
 colection = 5
 disscount = 8 * 5 * 0.75 = 30.0

 #First iteration
b1: 1, b2: 1, b3: 1, b4: 0, b5: 0
colection = 3
disscount = 8 * 3 * 0.90 = 21.6
=end