require_relative '00_tree_node'

class KnightPathFinder
    attr_reader :root_node

    def self.valid_moves(pos)
        short_offsets = [-1, 1]
        long_offsets = [-2, 2]
        moves = []

        long_offsets.each do |long_offset|
            short_offsets.each do |short_offset|
                pos_a = [pos.first + long_offset, pos.last + short_offset]
                pos_b = [pos.first + short_offset, pos.last + long_offset]

                moves << pos_a unless pos_a.min < 0 || pos_a.max > 7
                moves << pos_b unless pos_b.min < 0 || pos_b.max > 7
            end
        end

        return moves
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
    end
end