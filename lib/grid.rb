require_relative 'cell'

class Grid

	attr_accessor	:graticule
	attr_accessor	:vehicles
	
	def initialize(rows, columns)	
		@graticule = build(columns,rows)
	end

	def deploy(vehicle)
		@graticule[vehicle.coord_y][vehicle.coord_x].place(vehicle)
	end

	def check_on_grid(vehicle)
		@graticule[0].length > vehicle.coord_y && vehicle.coord_y >= 0 && @graticule.length > vehicle.coord_x && vehicle.coord_x >= 0
	end

	def current_cell(vehicle)
		graticule[vehicle.coord_y][vehicle.coord_x]
	end

	def previous_cell(vehicle)
		graticule[vehicle.prev_y][vehicle.prev_x]
	end
	
	def leave_a_warning(vehicle)
		previous_cell(vehicle).edge_at(vehicle.orientation)
	end
	
	def edge_on(vehicle)
		current_cell(vehicle).edge.include?(vehicle.orientation)
	end


private

	def build(columns, rows)
		graticule = Array.new(rows+1){Array.new(columns+1){Cell.new}}
	end

end