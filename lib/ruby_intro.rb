# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  sum = 0

  for i in arr
    sum  = sum + i
  end
  
  return sum
end

=begin
  Define a method max_2_sum(array) which takes an array of integers as an argument 
  and returns the sum of its two largest elements. For an empty array it should return
  zero. For an array with just one element, it should return that element. Run associated 
  tests via: $ rspec -e '#max_2_sum' spec/part1_spec.rb
=end
# Returns the sum of the 2 largest numbers in the array.
# @param [Array] Array of integers
# @return [Integer] Sum of the 2 largest numbers
def max_2_sum arr
  first = 0
  second = 0

	if arr.size <= 0
		return 0
	end

	if arr.size == 1
		return arr[0]
	end

  if arr[0] > arr[1]
    first = arr[0]
    second = arr[1]
  else
    first = arr[1]
    second = arr[0]
  end

  for i in arr
    if i > first
      second = first
      first = i
    elsif i > second and i != first
      second = 1
		end
  end

  return (first + second)
end

=begin
  Define a method sum_to_n?(array, n) that takes an array of integers and an additional 
  integer, n, as arguments and returns true if any two elements in the array of integers 
  sum to n. sum_to_n?([], n) should return false for any value of n, by definition. Run 
  associated tests via: $ rspec -e '#sum_to_n' spec/part1_spec.rb
=end
# @param [Array] Array of integers
# @param [Integer] An integer to see if the elements of the array sum to
# @return [Boolean] True if it does sum to it. False otherwise.
def sum_to_n? arr, n
  copyArr = arr

	if arr.size <= 1
		return false
	end

  for i in 0..arr.length
    for j in 0..arr.length
      if i != j
        if (arr[i].to_i + arr[j].to_i) == n
          return true
        end
      end
    end
  end
  return false
end

# Part 2

=begin
  Define a method hello(name) that takes a string representing a name and return
  s the string "Hello, " concatenated with the name. Run associated tests 
  via: $ rspec -e '#hello' spec/part2_spec.rb
=end
def hello(name)
  if name == nil
    return "Hello, "
  end

  return "Hello, " + name.to_s
end

=begin
  Define a method starts_with_consonant?(s) that takes a string and returns true 
  if it starts with a consonant and false otherwise. (For our purposes, a consonant 
  is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper 
  and lower case and for nonletters! Run associated tests 
  via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb
=end
# @param [String] String to see if starts with consonant
# @return [Boolean] True if first letter is consonant, false otherwise
def starts_with_consonant? s
  if (s == nil) or (s == '')
    return false
	end

  stringeroni = s.to_s
  lowString = stringeroni.downcase
  charArray = lowString.split('') # turn it into a char array
  first = charArray[0]

	# Determines if first character is indeed a letter.
	if not (first =~ /[A-Za-z]/)
		return false
	end

  if (first == 'a') or (first == 'e') or (first == 'i') or (first == 'o') or (first == 'u')
    return false
	end

  return true
end

=begin
  Define a method binary_multiple_of_4?(s) that takes a string and returns true if
  the string represents a binary number that is a multiple of 4. NOTE: be sure it 
  returns false if the string is not a valid binary number! Run associated tests 
  via: $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb
=end
def binary_multiple_of_4? s
  return true if s == "0"
  /^[10]*00$/.match(s) != nil
end

# Part 3
=begin
  Define a class BookInStock which represents a book with an ISBN number, isbn, and 
  price of the book as a floating-point number, price, as attributes. Run associated 
  tests via: $ rspec -e 'getters and setters' spec/part3_spec.rb
=end
class BookInStock
  def initialize(isbn, price)
    if (isbn == nil) or (price == nil)
      return
		end

		if (isbn.to_s == "")
			throw ArgumentError, "Cannot have an empty ISBN string!"
		end

		if (price <= 0.0)
			throw ArgumentError, "Price must be a positive, non-zero number!"
		end

		@isbn = isbn
		@price = price
  end

	# @param [String] new_isbn
	def isbn=(new_isbn)
		@isbn = new_isbn
	end

	#@return [String]
	def isbn
		@isbn
	end

	#@param [Float] The price of the textbook
	def price=(price)
		@price = price
	end

	# @return [Float] The price of the textbook
	def price
		@price
	end


  # Include a method price_as_string that returns the price of the book formatted with a 
  # leading dollar sign and two decimal places, that is, a price of 20 should format as 
  # "$20.00" and a price of 33.8 should format as "$33.80". Run associated tests 
  # via: $ rspec -e '#price_as_string' spec/part3_spec.rb

	# @return [String] String representation of the cost of the book formatted for reading.
	def price_as_string
		return format("$%.2f", @price)
	end
end

x = [1, -2, -3, -4, -5]
y = sum(x)
z = max_2_sum(x)
aa = sum_to_n?(x, 99)

puts "Sum of array [1,2,3,4]: " + y.to_s
puts "Sum of 2 largest: " + z.to_s
puts aa

puts hello("Yeeteroni")

puts ("Aloe " + starts_with_consonant?("Aloe").to_s)

bookeroni = BookInStock.new("23u49328932084", 69.69)
puts("Price of bookeroni: " + bookeroni.price_as_string.to_s())
