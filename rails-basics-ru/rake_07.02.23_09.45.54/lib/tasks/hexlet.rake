require 'csv'

namespace :hexlet do
  desc "This task downloads and creates user list from CSV file"
  task :import_users, [:path] => :environment do |t, args|
    file_path = args[:path]

    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |user|
      user[:birthday] = DateTime.strptime(user[:birthday], '%m/%d/%Y')
      User.create(user)
    end
  end

end
