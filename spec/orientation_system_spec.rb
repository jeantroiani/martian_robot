require 'orientation_system'
	
describe Orientation_system do

	let(:four_side_system){Orientation_system.new}
	
	context 'has' do

		it 'keys to be used and access as orientation' do
			expect(four_side_system.keys['N']).to eq('E')
			expect(four_side_system.keys['E']).to eq('S')
			expect(four_side_system.keys['S']).to eq('W')
			expect(four_side_system.keys['W']).to eq('N')
		end

	end

end