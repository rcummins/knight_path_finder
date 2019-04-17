require 'RSpec'
require '01_knight_path_finder'

describe 'KnightPathFinder' do
    let(:kpf) { KnightPathFinder.new([0, 0]) }

    describe '::valid_moves' do
        it 'returns the correct positions for an initial pos of [3, 3]' do
            expected_moves = [[1, 2], [2, 1], [1, 4], [4, 1],
                [5, 2], [2, 5], [5, 4], [4, 5]]
            expect(KnightPathFinder.valid_moves([3,3])).to eq(expected_moves)
        end

        it 'returns the correct positions for an initial pos of [0, 3]' do
            expected_moves = [[1, 1], [2, 2], [2, 4], [1, 5]]
            expect(KnightPathFinder.valid_moves([0,3])).to eq(expected_moves)
        end

        it 'returns the correct positions for an initial pos of [7, 3]' do
            expected_moves = [[5, 2], [6, 1], [5, 4], [6, 5]]
            expect(KnightPathFinder.valid_moves([7,3])).to eq(expected_moves)
        end

        it 'returns the correct positions for an initial pos of [0, 0]' do
            expected_moves = [[2, 1], [1, 2]]
            expect(KnightPathFinder.valid_moves([0,0])).to eq(expected_moves)
        end
    end

    describe '#initialize' do
        it 'sets the instance variable @root_node to a PolyTreeNode' do
            expect(kpf.root_node.class).to eq(PolyTreeNode)
        end

        it 'sets the value of @root_node equal to the starting position' do
            expect(kpf.root_node.value).to eq([0, 0])
        end

        it 'sets @considered_positions to array containing start position' do
            expect(kpf.considered_positions).to eq([[0, 0]])
        end
    end

    describe '#new_move_positions' do
        it 'returns the correct positions for an initial pos of [0, 0]' do
            expect(kpf.new_move_positions([0, 0])).to eq([[2, 1], [1, 2]])
        end

        it 'adds the new move positions to @considered_positions' do
            kpf.new_move_positions([0, 0])
            expected_moves = [[0, 0], [2, 1], [1, 2]]
            expect(kpf.considered_positions).to eq(expected_moves)
        end

        it 'returns correct positions after move from [0, 0] to [2, 1]' do
            kpf.new_move_positions([0, 0])
            expected_moves = [[0, 2], [4, 0], [1, 3], [4, 2], [3, 3]]
            expect(kpf.new_move_positions([2, 1])).to eq(expected_moves)
        end

        it '@considered_positions correct after move from [0,0] to [2,1]' do
            kpf.new_move_positions([0, 0])
            kpf.new_move_positions([2, 1])
            expected_moves = [[0, 0], [2, 1], [1, 2], [0, 2], [4, 0], [1, 3],
                [4, 2], [3, 3]]
            expect(kpf.considered_positions).to eq(expected_moves)
        end
    end
end