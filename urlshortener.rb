require "redis"
$alphabet = "0123456789abcdefghijklmnopqrstuvwzxyABCDEFGHIJKLMNOPQRSTUVWXYZ$%"
$URL_COUNTER_KEY = "URL_COUNT"
$URL_KEY_PREFIX = "url-"

def change_base(num, alphabet=$alphabet)
  # base 10 to base k: http://www.cs.umd.edu/class/sum2003/cmsc311/Notes/Data/toBaseK.html
  if num == 0
    return alphabet[0]
  end
  result = ""
  k = alphabet.length
  index = 0
  while num != 0
    remainder = num % k
    num = num / k
    result = alphabet[remainder] + result
  end
  return result

end

class URLShortener

  def initialize(redis)
    @redis = redis
  end

  def store_url(url)
    counter = @redis.incr($URL_COUNTER_KEY)
    short_url = change_base(counter)
    @redis.set($URL_KEY_PREFIX + short_url, url)
    return short_url
  end

  def retrieve_url(short_url)
    return @redis.get($URL_KEY_PREFIX + short_url)
  end
end

if __FILE__ == $0
  redis = Redis.new(:host => "localhost")
  shortener = URLShortener.new(redis)
  puts shortener.store_url("http://google.com")
end
