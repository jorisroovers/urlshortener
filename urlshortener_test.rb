require 'test/unit'
require_relative "urlshortener"

class MyTest < Test::Unit::TestCase

  def test_change_base()
    # Do a test with a default hex alphabet
    alphabet = "0123456789abcdef"
    (0...1000).each do |i|
      assert_equal(i.to_s(16), change_base(i, alphabet))
    end

    # Do some specific tests with a special random alphabet
    alphabet = "3H$DWEi"
    (0...alphabet.length).each do |i|
      assert_equal(alphabet[i], change_base(i, alphabet))
    end
    assert_equal("H3", change_base(7, alphabet))
    assert_equal("HD", change_base(10, alphabet))
    assert_equal("HE3E", change_base(593, alphabet)) # 593 -> 1505 in base 7
    assert_equal("$$H3", change_base(791, alphabet)) # 791 -> 2210 in base 7
    assert_equal("$3iiDiHW$", change_base(12345678, alphabet)) # 12345678 -> 206636142 in base 7

  end


end