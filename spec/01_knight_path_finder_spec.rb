require 'RSpec'
require '01_knight_path_finder'

describe 'KnightPathFinder' do
    let(:kpf) { KnightPathFinder.new([3, 3]) }

    describe '::valid_moves' do
        it 'returns the correct positions for an initial pos of [3, 3]' do
            expected_moves = [[1, 2], [2, 1], [1, 4], [4, 1],
                [5, 2], [2, 5], [5, 4], [4, 5]]
            expect(KnightPathFinder.valid_moves([3,3])).to eq(expected_moves)
        end
    end

    describe '#initialize' do
        it 'sets the instance variable @root_node to a PolyTreeNode' do
            expect(kpf.root_node.class).to eq(PolyTreeNode)
        end

        it 'sets the value of @root_node equal to the starting position' do
            expect(kpf.root_node.value).to eq([3, 3])
        end
    end
end