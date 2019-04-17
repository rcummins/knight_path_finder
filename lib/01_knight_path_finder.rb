require_relative '00_tree_node'
require 'byebug'

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

    def build_move_tree
        nodes_to_explore = [@root_node]

        until nodes_to_explore.empty?
            this_node = nodes_to_explore.shift
            positions_to_add = new_move_positions(this_node.value)

            positions_to_add.each do |position_to_add|
                new_node = PolyTreeNode.new(position_to_add)
                new_node.parent = this_node
                nodes_to_explore.push(new_node)
            end
        end
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        current_node = end_node
        path = [current_node.value]

        until current_node == @root_node
            current_node = current_node.parent
            path.unshift(current_node.value)
        end

        return path
    end
end
