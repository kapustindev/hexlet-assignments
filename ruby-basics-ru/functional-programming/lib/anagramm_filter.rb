# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, other)
  other.filter { |w| w.chars.sort == word.chars.sort }
end
# END
