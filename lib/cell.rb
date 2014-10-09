class Cell
	
	attr_accessor :transport
	attr_accessor :edge

	def initialize
		@transport = []
		@edge      = []
	end

	def place(subject)
		transport << subject
	end

	def release(subject)
		transport.delete(subject)
	end

	def edge_at(orientation)
		@edge << orientation
	end

end
