# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      uri = URI('https://rails-collective-blog-ru.hexlet.app')
      get_path = '/users/sign_up'
      post_path = '/users'

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new URI.join(uri, get_path)

      response = http.request request

      cookie = response.response['set-cookie'].split('; ')[0]

      doc = Nokogiri::HTML(response.body)
      input = doc.at('input[@name="authenticity_token"]')
      token = input['value']

      params = {
        authenticity_token: token,
        user: {
          email: email,
          password: password,
          password_confirmation: password
        },
        # commit: 'Регистрация'
      }

      uri = URI.join(uri, post_path)
      request = Net::HTTP::Post.new uri
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request.body = Rack::Utils.build_nested_query(params)
      request['Cookie'] = cookie

      http.request request
    end
    # END
  end
end
