# frozen_string_literal: true

# BEGIN
class Url
  attr_reader :scheme, :url, :host
  include Comparable
  def ==(other)
    url == other.url
  end

  def initialize(url)
    @url = url
    @scheme = URI(url).scheme
    @host = URI(url).host
  end

  def query_params
    query = URI(url).query
    return {} if query.nil?
    query.split('&').each_with_object({}) do |q, acc|
      key, value = q.split('=')
      acc[key.to_sym] = value
    end
  end

  def query_param(key, defaultValue = nil)
    query_params[key] ||= defaultValue
  end
end
# END
