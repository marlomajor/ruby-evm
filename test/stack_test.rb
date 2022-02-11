require 'minitest/autorun'
require 'pry'

require_relative '../lib/stack'

class StackTest < Minitest::Test
	def startup
		@stack = Stack.new
	end 

	def test_it_pushes_onto_stack
		startup
		@stack.push(5)
		assert_equal @stack.get_stack, [5]
  end

	def test_it_pops_off_stack
		startup
		@stack.push(1).push(2)

		assert_equal @stack.get_stack, [1,2]
		assert_equal @stack.pop, 2
		assert_equal @stack.get_stack, [1]
	end

	def test_stack_data_structure
		startup
		
		assert_kind_of Array, @stack.get_stack
	end

	#TODO fix these tests. They don't fail currently.
	def test_throws_underflow
		startup
		assert_raises(StandardError) { stack.push(-1) }
	end

	def test_throws_overflow
		startup
		assert_raises(StandardError) { stack.push(2**270) }
	end
end