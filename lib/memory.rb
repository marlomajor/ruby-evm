#!/usr/bin/env ruby

class Memory
	def initialize
		@memory = []
	end

	# ruby has a conflict on the word store, hence stor
	def stor(offset, value)
		if offset<0 || offset > 2**256-1
			raise StandardError.new "Invalid Memory Access: {'offset': #{offset}, 'value': #{value}}" 
		end
		if value<0 || value > 2**8-1
			raise StandardError.new "Invalid Memory Value: {'offset': #{offset}, 'value': #{value}}"
		end

		# expand array to given size
		Array.class_eval do
			def in_size(expected_size, fill_with = nil)
				sized = self[0, expected_size]
				sized << fill_with while sized.size < expected_size
				sized
			end
		end

		# expand memory if needed
		if offset > @memory.length
			@memory.in_size(offset)
		end

		@memory[offset] = value
	end

	def load(offset)
		if offset < 0
			raise StandardError.new "Invalid Memory Access #{offset}"
		end

		0 if offset >= @memory.length

		@memory[offset]
	end
end