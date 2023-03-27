# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    stub_request(:get, 'https://api.github.com/repos/octokit/octokit.rb')
      .to_return(
        status: 200,
        body: load_fixture('files/response.json'),
        headers: { 'Content-Type' => 'application/json' }
      )

    @attrs = {
      link: 'https://github.com/octokit/octokit.rb'
    }
  end

  test 'should create' do
    post repositories_url, params: { repository: @attrs }

    repository = Repository.find_by @attrs

    assert { repository }
  end
  # END
end
