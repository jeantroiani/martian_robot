require 'cell'

describe Cell do

	let(:cell){Cell.new}
	let(:robot){double :robot}

	context 'has' do

		it 'no robots on it when created' do
			expect(cell.transport).to eq ([])
		end

		it 'when created no warning of edge of terrain' do
			expect(cell.edge).to eq ([])
		end

		it 'a warning of edge of the terrain' do
			cell.edge_at("N")
			expect(cell.edge).to eq(["N"])
		end

	end

	context 'can' do

		it 'hold a robot' do
			cell.place(robot)
			expect(cell.transport).to eq ([robot])
		end		

		it 'release a robot' do
			cell.place(robot)
			cell.release(robot)
			expect(cell.transport).to eq ([])
		end 
	
	end

end