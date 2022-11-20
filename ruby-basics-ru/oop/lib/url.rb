# frozen_string_literal: true

# BEGIN
require 'forwardable'

class Url
  attr_reader :url
  extend Forwardable
  def_delegators :url, :scheme, :host

  include Comparable
  def ==(other)
    url.to_s == other.url.to_s
  end

  def initialize(url)
    @url = URI(url)
  end

  def query_params
    query = url.query
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
