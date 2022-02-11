#!/usr/bin/env ruby

# We need a stack of 256-bit words with a maximum size of 1024 for the EVM
class Stack
	def initialize(max_depth=1024)
		@stack = []
		@max_depth = max_depth
	end

	def push(item)
		raise StandardError.new "InvalidStackItem (#{item})" if item < 0 || item>2**256-1
		raise StandardError.new "Stack Overflow" if @stack.length + 1 > @max_depth

		@stack.append(item)
	end

	def pop
		raise StandardError.new "Stack Underflow" if @stack.length == 0
		@stack.pop
	end

	def get_stack
		@stack
	end
end
