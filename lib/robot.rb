require_relative 'orientation_system'

class Robot

	attr_accessor :coord_x
	attr_accessor :coord_y
	attr_accessor :orientation
	attr_accessor :orientation_keys
	attr_accessor :prev_x
	attr_accessor :prev_y
	attr_accessor :prev_orientation

	def initialize(coord_x, coord_y, orientation, orientation_system)
		@coord_x 		 			= coord_x
		@coord_y 		      = coord_y
		@prev_x						= coord_x
		@prev_y						= coord_y
		@prev_orientation = orientation
		@orientation      = orientation
		@orientation_keys = orientation_system.keys
	end

	def move_forward
		save_previous_location
		move_forward_system
	end
	
	def turn(side)
		side == "R" ? turn_right : turn_left
	end

	def set_to_lost
		self.orientation = "LOST"
	end

	def is_lost?
		self.orientation == "LOST"
	end
	
	def print_output
		if orientation == "LOST"
			"#{self.prev_x}#{self.prev_y}#{self.prev_orientation}#{self.orientation}"
		else
			"#{self.coord_x}#{self.coord_y}#{self.orientation}"
		end
	end


	private
	
	def move_forward_system
		if @orientation == 'N' 
			@coord_y += 1
		elsif	@orientation == 'S'
			@coord_y -= 1
		elsif @orientation == 'E'
			@coord_x += 1
		else	
			@coord_x -= 1
		end	
	end

	def turn_right
		@orientation = @orientation_keys[@orientation]
	end

	def turn_left
		@orientation = @orientation_keys.key(@orientation)
	end
	
	def save_previous_location
		@prev_x	= @coord_x
		@prev_y = @coord_y
		@prev_orientation = @orientation
	end

end