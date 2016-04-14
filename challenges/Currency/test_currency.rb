require 'minitest/autorun'
require_relative 'currency'

class CurrencyTest < Minitest::Test



  def test_single_dollars
    assert_equal "$1.00", to_currency("1")
  end

  def test_tens
    assert_equal "$11.00", to_currency("11")
  end

  def test_mixed
    assert_equal "$13.65", to_currency("13.65")
  end

  def test_some
    assert_equal "$100,000.00", to_currency("100000") 
  end

  def test_another
    assert_equal "$3,456,789,879.10", to_currency("3456789879.1")
  end

  def test_dollar_format
    assert_equal '$', to_currency("5")[0]
  end

  def test_cents_formatting
    assert_equal '.32', to_currency("10.32")[-3..-1]
  end

  def test_rounds_to_hundreth
    assert_equal '$22.57', to_currency("22.5683213")
  end

  def test_small_number
    assert_equal '$782.32', to_currency("782.32")
  end

  def test_large_number
    assert_equal '$3,234,111.85', to_currency("3234111.85")
  end

end
