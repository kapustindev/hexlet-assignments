# frozen_string_literal: true

# BEGIN
require 'date'

def to_date(val)
  d, m, y = val.split("/").map(&:to_i)
  DateTime.new(y, m, d)
end

def to_type(value, type)
  case type
    when :integer then value.to_i
    when :string then value.to_s
    when :datetime then to_date(value)
    else value
  end
end

module Model
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  def initialize attrs = {}
    @attrs = attrs
  end

  def attributes
    @attrs
  end

  module ClassMethods
    def attribute name, options
      define_method name do
        res = to_type(self.attributes[name], options[:type])
        self.attributes[name] = res
        res
      end

      define_method "#{name}=" do |value|
        self.attributes[name] = value
      end
    end
  end
end
# END
