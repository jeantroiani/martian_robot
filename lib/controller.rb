require_relative 'robot'
require_relative 'grid'

class Controller

	attr_accessor :grid
	attr_accessor :vehicle
	
	def create_grid(rows, columns)
		@grid = Grid.new(rows, columns)
	end

	def deploy(coord_x, coord_y, orientation)
		orientation_system = Orientation_system.new
		@vehicle = Robot.new(coord_x, coord_y, orientation, orientation_system)
		@grid.deploy(vehicle)
	end


	def parse(sequence)
		convert_commands(sequence).map do |el|
			if el == 'F'
				move(vehicle)
				 if vehicle.is_lost?
				 	break
				 end
			else
				vehicle.turn(el)
			end
		end
		vehicle.print_output
	end

	private

	def convert_commands(sequence)
		sequence.split("")
	end

	def move(vehicle)  
		if @grid.edge_on(vehicle)
			return
		else
			vehicle.move_forward
			if !@grid.check_on_grid(vehicle)
				@grid.leave_a_warning(vehicle)
				vehicle.set_to_lost
			end
		end
	end

end