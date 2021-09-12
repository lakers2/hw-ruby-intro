# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  all = 0
  arr.each{ |n| all = all + n }
  return all
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr[0]
  else
    if arr[0]>arr[1]
      bigger = arr[0]
      big = arr[1]
    else
      bigger = arr[1]
      big = arr[0]
    end
      
    for i in 2..arr.length-1 do
      if arr[i] > big
        if arr[i] > bigger
          big = bigger
          bigger = arr[i]
        else
          big = arr[i]
        end
      end
    end
    
    return big+bigger
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  hash = {}
  len = arr.length
  for i in 0..len-1 do
    if(hash.has_key?(n-arr[i]))
      return true
    else
      hash[arr[i]] = i
    end
  end
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, " + name.to_s
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if s.length == 0
    return false
  end
  if !s[0,1].match?(/[A-Za-z]/)
    return false 
  end
  vowel_arr = ['a','e','i','o','u']
  first = s[0,1].downcase
  vowel_arr.each do |c|
    if first == c
      return false
    end
  end
  return true
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if (s =~ /\A\d+\Z/) == 0
    if s.to_i(2)%4 == 0
      return true
    else
      return false
    end
  end
  return false
  
end

# Part 3

class BookInStock
# YOUR CODE HERE
  def initialize(isbn, price)
    if (isbn =~ /\w+|-+/) != 0
      raise ArgumentError.new("invalid isbn") 
    else
      @isbn = isbn
    end
    
    if price <=0
      raise ArgumentError.new("price should be larger than 0")
    else
      @price = price
    end
  end
  
  attr_accessor :price, :isbn
  
  def price_as_string
    decimal= @price.to_f.to_s.split('.')[1]
    return decimal.length >= 2?   '$'+@price.to_f.round(2).to_s : '$'+@price.to_f.to_s + '0'
  end
end
