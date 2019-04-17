require 'RSpec'
require '01_knight_path_finder'

describe 'KnightPathFinder' do
    let(:kpf) { KnightPathFinder.new([3, 3]) }

    describe '#initialize' do
        it 'sets the instance variable @root_node to a PolyTreeNode' do
            expect(kpf.root_node.class).to eq(PolyTreeNode)
        end

        it 'sets the value of @root_node equal to the starting position' do
            expect(kpf.root_node.value).to eq([3, 3])
        end
    end
end