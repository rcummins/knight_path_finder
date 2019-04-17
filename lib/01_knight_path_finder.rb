require_relative '00_tree_node'

class KnightPathFinder
    attr_reader :root_node

    def self.valid_moves(pos)
        short_offsets = [-1, 1]
        long_offsets = [-2, 2]
        moves = []

        long_offsets.each do |long_offset|
            short_offsets.each do |short_offset|
                moves << [pos.first + long_offset, pos.last + short_offset]
                moves << [pos.first + short_offset, pos.last + long_offset]
            end
        end

        return moves
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
    end
end