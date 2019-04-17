require_relative '00_tree_node'

class KnightPathFinder
    attr_reader :root_node, :considered_positions

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
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        new_moves = self.class.valid_moves(pos).reject do |possible_pos|
            @considered_positions.include?(possible_pos)
        end

        @considered_positions.concat(new_moves)

        return new_moves
    end
end