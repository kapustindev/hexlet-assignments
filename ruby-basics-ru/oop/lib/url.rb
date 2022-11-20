# frozen_string_literal: true

# BEGIN
class Url
  attr_reader :url

  include Comparable
  def ==(other)
    url.to_s == other.url.to_s
  end

  def initialize(url)
    @url = url
  end

  def scheme
    url[0...url.index(':')];
  end

  def host
    without_scheme = url.split('/')[2]
    result = without_scheme.include?(':') ? without_scheme.split(':') : without_scheme.split('?')
    result.first
  end

  def query
    url.include?('?') ? url.split('?').last : nil
  end

  def query_params
    return {} if query.nil?
  
    query.split('&').each_with_object({}) do |q, acc|
      key, value = q.split('=')
      acc[key.to_sym] = value
    end
  end

  def query_param(key, default_value = nil)
    query_params[key] ||= default_value
  end
end
# END
