require 'grid'
	
	describe Grid do

		let(:mars) {Grid.new(3, 5)}
		let(:robot){double :robot, coord_x: 1 ,coord_y: 1, prev_y:1, prev_x:1, orientation: "S"}

		context 'can' do
		
			it 'be created with X number of rows and columns ' do
				expect(mars.graticule.length).to eq (4)
				expect(mars.graticule[0].length).to eq (6)
			end

			it 'place a vehicle in the graticule based on its coordinates' do
				mars.deploy(robot)
				expect(mars.graticule[1][1].transport).to eq([robot])
			end

			it 'say that the car leave inside the grid if is true' do
				mars.deploy(robot)
				expect(mars.check_on_grid(robot)).to be(true)
			end

			it 'can tell the coordinates of a vehicle' do
				mars.deploy(robot)
				expect(mars.current_cell(robot)).to eq(mars.graticule[1][1])
			end

			it 'leave a warning of edge from vehicles' do
				mars.deploy(robot)
				mars.leave_a_warning(robot)
				expect(mars.graticule[1][1].edge).to eq(["S"])
			end   
			
			it 'can tell if the subject is on the edge of the grid' do
				mars.deploy(robot)
				mars.leave_a_warning(robot)
				expect(mars.edge_on(robot)).to be(true)
			end  	  
		
		end
		
	end