class Fizzbuzz

	def fizzBuzz(arr, min, max)

		for n in min..max do

			fill(n, compare(n), arr)
		end

		arr
	end

	def fill(pos, n, arr)

		arr[pos] = n
	end

	def compare(n)

		if divisible_by?(n, 3, 5)
			'FizzBuzz'
		elsif divisible_by?(n, 3)
			'Fizz'
		elsif divisible_by?(n, 5)
			'Buzz'
		else
			n
		end
	end

	def divisible_by?(n, *args)
		(n % args[0] == 0 and args[1] == nil) || (n % args[0] == 0 and n % args[1] == 0)
	end
end

# fbz = Fizzbuzz.new
# fbz.fizzBuzz([], 1, 100)