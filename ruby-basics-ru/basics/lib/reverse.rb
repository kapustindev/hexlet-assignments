# frozen_string_literal: true

# BEGIN
def reverse(text)
    result = ''
    text.each_char do |char|
        result = "#{char}#{result}"
    end
    result
end    
# END
