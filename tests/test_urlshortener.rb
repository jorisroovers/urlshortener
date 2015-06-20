require 'test/unit'
require 'mock_redis'
require_relative "../urlshortener"

class URLShortenerTest < Test::Unit::TestCase

  def test_store_retrieve_url()
    mockredis = MockRedis.new
    shortener = URLShortener.new(mockredis)

    # simple URL
    short_url = shortener.store_url("foobar")
    original_url = shortener.retrieve_url(short_url)
    assert_equal("1", short_url)
    assert_equal("foobar", original_url)

    # set the $URL_COUNTER_KEY to something bigger
    mockredis.set($URL_COUNTER_KEY, 51876789)
    short_url = shortener.store_url("foobar2")
    original_url = shortener.retrieve_url(short_url)
    assert_equal("35VeS", short_url)
    assert_equal("foobar2", original_url)
  end

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
