$alphabet = "0123456789abcdefghijklmnopqrstuvwzxyABCDEFGHIJKLMNOPQRSTUVWXYZ$%"


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
