# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def test_is_stack_empty_after_init
    assert @stack.to_a.empty?
  end

  def test_push_into_stack
    @stack.push! 'Hello!'
    assert_includes @stack.to_a, 'Hello!'
  end

  def test_pop_out_of_stack
    @stack.push! 'Hello!'
    poppedMessage = @stack.pop!
    assert_equal 'Hello!', poppedMessage
  end

  def test_of_getting_size
    [1, 2, 3, 4, 5].each { |num| @stack.push! num }
    assert_equal 5, @stack.size
  end

  def test_of_clearing_stack
    [1, 2, 3, 4, 5].each { |num| @stack.push! num }
    @stack.clear!
    assert_empty @stack.to_a
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.to_s.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
