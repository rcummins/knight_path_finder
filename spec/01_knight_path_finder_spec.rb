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

    describe '#build_move_tree' do
        it 'builds correct tree for an initial pos of [0, 0]' do
            kpf.build_move_tree
            expect(kpf.root_node.children.length).to eq(2)
            expect(kpf.root_node.children.first.value).to eq([2, 1])
            expect(kpf.root_node.children.last.value).to eq([1, 2])
            expect(kpf.root_node.children.first.children.length).to eq(5)
            expect(kpf.considered_positions.length).to eq(64)
            expected_1st_8 = [[0, 0], [2, 1], [1, 2], [0, 2],
                [4, 0], [1, 3], [4, 2], [3, 3]]
            expect(kpf.considered_positions.take(8)).to eq(expected_1st_8)
        end

        it 'builds correct tree for an initial pos of [3, 3]' do
            kpf33 = KnightPathFinder.new([3, 3])
            kpf33.build_move_tree
            expect(kpf33.root_node.children.length).to eq(8)
            expect(kpf33.root_node.children.first.value).to eq([1, 2])
            expect(kpf33.root_node.children.last.value).to eq([4, 5])
            expect(kpf33.root_node.children.first.children.length).to eq(5)
            expect(kpf33.considered_positions.length).to eq(64)
            expected_1st_9 = [[3, 3], [1, 2], [2, 1], [1, 4], [4, 1],
                [5, 2], [2, 5], [5, 4], [4, 5]]
            expect(kpf33.considered_positions.take(9)).to eq(expected_1st_9)
        end
    end
end
