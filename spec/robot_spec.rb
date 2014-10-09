require 'robot'

describe Robot do

	let(:orientation_system){Orientation_system.new}
	let(:robot){Robot.new(1, 3, "N", orientation_system)}
	
	context 'has' do

		it 'coordinates when deployed' do
			expect(robot.coord_x).to eq(1)
			expect(robot.coord_y).to eq(3)
		end

		it 'orientation when deployed' do
			expect(robot.orientation).to eq('N')
		end		

	end

	context 'can' do
		
		it 'move forward 1 step if facing North' do
			robot.move_forward
			expect(robot.coord_x).to eq(1)
			expect(robot.coord_y).to eq(4)
		end

		it 'move forward 1 step if facing West' do
			robot.orientation = 'W'
			robot.move_forward
			expect(robot.coord_x).to eq(0)
			expect(robot.coord_y).to eq(3)
		end

		it 'move forward 1 step if facing East' do
			robot.orientation = 'E'
			robot.move_forward
			expect(robot.coord_x).to eq(2)
			expect(robot.coord_y).to eq(3)
		end

		it 'move forward 1 step if facing South' do
			robot.orientation = 'S'
			robot.move_forward
			expect(robot.coord_x).to eq(1)
			expect(robot.coord_y).to eq(2)
		end

		it 'turn right' do
			robot.turn('R')
			expect(robot.orientation).to eq('E')
		end

		it 'turn left' do
			robot.turn('L')
			expect(robot.orientation).to eq('W')
		end

		it 'output his location and orientation on the grid' do
			expect(robot.print_output).to eq('13N')
		end

		it 'output his location before leaving the grid' do
			robot.move_forward
			robot.orientation = 'LOST'
			expect(robot.print_output).to eq('13NLOST')
		end

		it 'set orientation to LOST' do
			robot.set_to_lost
			expect(robot.orientation).to eq('LOST')
		end

		it 'tell if he is lost' do
			robot.set_to_lost
			expect(robot.is_lost?).to be(true)
		end

	end
	
end