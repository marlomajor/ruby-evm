require 'minitest/autorun'
require 'pry'
require_relative '../lib/memory'

class MemoryTest < Minitest::Test
	def setup
		@memory = Memory.new
	end 

	def test_can_store_in_memory
		setup
		# binding.pry
		@memory.stor(2**240, 2**4)
	end
end