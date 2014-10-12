require 'controller'

describe Controller do

	let(:controller){Controller.new}

	context 'can' do

		it 'create a grid' do
			controller.create_grid(2,4)
			expect(controller.grid.graticule.length).to eq(3)
		end

		it 'deploy a vehicle' do
			controller.create_grid(4, 4)
			controller.deploy(1, 1, 'N')
			expect(controller.grid.graticule[1][1].transport).not_to be_empty
			expect(controller.grid.graticule[2][2].transport).to be_empty
		end

		it 'parse commands even if they are lowercase' do
			controller.create_grid(5, 3)
			controller.deploy(1, 1, 'E')
			expect(controller.parse('lf')).to eq('12N')
		end

		it 'ignore commands that are not R L or F' do
			controller.create_grid(5, 3)
			controller.deploy(1, 1, 'E')
			expect(controller.parse('lxfx')).to eq('12N')
		end

	end

	context 'test' do

		it 'runs here' do
			controller.create_grid(5, 3)
			controller.deploy(1, 1, 'E')
			expect(controller.parse('RFRFRFRF')).to eq('11E')
			controller.deploy(3, 2, 'N')
			expect(controller.parse('FRRFLLFFRRFLL')).to eq('33NLOST')
			controller.deploy(0, 3, 'W')
			expect(controller.parse('LLFFFLFLFL')).to eq('23S')
		end 

	end

end