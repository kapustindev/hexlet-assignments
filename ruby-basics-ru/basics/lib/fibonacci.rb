# frozen_string_literal: true

# BEGIN
def fibonacci(n)
    return nil if n < 0
    return 0 if n.zero?
    result = [0, 1]
    idx = 1
    until result.length > n
        result << result[idx] + result[idx - 1]
        idx += 1
    end
    result.last
end
# END
