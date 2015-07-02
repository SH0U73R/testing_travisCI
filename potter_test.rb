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
    assert_equal(8 * 2 * 0.95, @potter.price({b1: 1, b2: 1, b3: 0, b4: 0, b5: 0}))
    assert_equal(8 * 3 * 0.90, @potter.price({b1: 1, b2: 1, b3: 1, b4: 0, b5: 0}))
    assert_equal(8 * 4 * 0.80, @potter.price({b1: 1, b2: 1, b3: 1, b4: 1, b5: 0}))
    assert_equal(8 * 5 * 0.75, @potter.price({b1: 1, b2: 1, b3: 1, b4: 1, b5: 1}))

  end

  def test_several_discounts
    assert_equal(8 + (8 * 2 * 0.95), @potter.price({b1: 2, b2: 1, b3: 0, b4: 0, b5: 0})) #23.2
    assert_equal(2 * (8 * 2 * 0.95), @potter.price({b1: 2, b2: 2, b3: 0, b4: 0, b5: 0})) #30.4
    assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), @potter.price({b1: 2, b2: 1, b3: 2, b4: 1, b5: 0})) #40.8
    assert_equal(8 + (8 * 5 * 0.75), @potter.price({b1: 1, b2: 2, b3: 1, b4: 1, b5: 1})) #38
  end

  def test_edge_cases
    assert_equal(2 * (8 * 4 * 0.8), @potter.price({b1: 2, b2: 2, b3: 2, b4: 1, b5: 1}))
    assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
    @potter.price({b1: 5, b2: 5, b3: 4, b4: 5, b5: 4}))
  end

end

#First iteration
b1: 2, b2: 2, b3: 2, b4: 1, b5: 1
 colection = 5
 disscount = 8 * 5 * 0.75 = 30.0

 #First iteration
b1: 1, b2: 1, b3: 1, b4: 0, b5: 0
colection = 3
disscount = 8 * 3 * 0.90 = 21.6
