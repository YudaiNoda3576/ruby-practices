class FizzBuzz
  FIZZ_NUM = 3
  BUZZ_NUM = 5

  def run(min, max)
    min.upto(max) do |number|
      puts convert_fizzbuzz(number)
    end
  end

  def convert_fizzbuzz(number)
    if (number % FIZZ_NUM).zero? && number % BUZZ_NUM != 0
      puts 'Fizz'
    elsif number % FIZZ_NUM != 0 && (number % BUZZ_NUM).zero?
      puts 'Buzz'
    elsif (number % FIZZ_NUM).zero? && (number % BUZZ_NUM).zero?
      puts 'FizzBuzz'
    else
      puts number
    end
  end
end
  FizzBuzz.new.run(1,20)
