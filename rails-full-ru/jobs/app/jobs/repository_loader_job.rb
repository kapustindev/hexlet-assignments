require 'octokit'

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(repository_id)
    # Do something later
    repository = Repository.find(repository_id)
    repository.fetch!

    client = Octokit::Client.new
    repo = Octokit::Repository.from_url(repository.link)
    repo_data = client.repository(repo)

    repository.update!(
      repo_name: repo_data[:name],
      owner_name: repo_data[:owner][:login],
      description: repo_data[:description],
      default_branch: repo_data[:default_branch],
      watchers_count: repo_data[:watchers_count],
      language: repo_data[:language],
      repo_created_at: repo_data[:created_at],
      repo_updated_at: repo_data[:updated_at]
    )

    repository.finish
    repository.save!
    
  rescue FetchError
    repository.fail!
  end
end
