# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
    return nil if start > stop
    result = []
    start.upto(stop).to_a.each do |num|
        case true
        when num % 3 == 0 && num % 5 == 0
            result << 'FizzBuzz'
        when num % 3 == 0
            result << 'Fizz'
        when num % 5 == 0
            result << 'Buzz'
        else
            result << num
        end
    end
    result.join(' ')
end
# END
