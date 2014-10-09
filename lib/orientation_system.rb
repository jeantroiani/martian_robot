class Orientation_system
	
	attr_accessor :keys

	def initialize

		@keys = {
			'N' => 'E',
			'E'	=> 'S',
			'S' => 'W',
			'W' => 'N'
		}
		
	end

end