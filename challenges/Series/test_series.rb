require 'minitest/autorun'
require_relative 'series'

class SeriesTest < Minitest::Test

  def test_new
    assert_equal([1,2,3], Series.new('123', 1).array_of_nums)
  end

  def test_slice_one
    assert_equal([[1],[2],[3]], Series.new('123', 1).answer)
  end

  def test_slice_two 
    assert_equal([[1,2],[2,3]], Series.new('123', 2).answer)
  end

  def test_simple_case 
    assert_equal( [[0,1,2], [1,2,3], [2,3,4]], Series.new('01234',3).answer)
  end

  def test_another_simple_case
    assert_equal( [[0,1,2,3], [1,2,3,4]], Series.new('01234',4).answer)
  end

  def test_slice_of_five
    assert_equal( [[1,2]], Series.new('81228', 2).answer)
  end

  def test_zero_length 
    assert_equal([],Series.new('01234', 0).answer)
  end

  def test_multiples
    assert_equal([[0,1], [1,2]], Series.new('0112', 2).answer)
  end

  def test_more_than_you_ask_for
    assert_raises ArgumentError do
      Series.new('0112', 5)
    end
  end
end





