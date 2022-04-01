class FizzBuzz
  FIZZ_NUM = 3
  BUZZ_NUM = 5

  def run(min, max)
    min.upto(max) do |number|
      puts convert_fizzbuzz(number)
    end
  end

  def convert_fizzbuzz(number)
    if (number % FIZZ_NUM).zero? && (number % BUZZ_NUM).zero?
      puts 'FizzBuzz'
    elsif (number % FIZZ_NUM).zero?
      puts 'Fizz'
    elsif (number % BUZZ_NUM).zero?
      puts 'Buzz'
    else
      puts number
    end
  end
end
  FizzBuzz.new.run(1,20)
