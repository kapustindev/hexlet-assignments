# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users.filter { |user| user[:gender] == 'male' }
    .each_with_object({}) do |user, acc|
      year, = user[:birthday].split('-')
      acc[year] ||= 0
      acc[year] += 1
    end
end
# END
