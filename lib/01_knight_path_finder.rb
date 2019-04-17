require_relative '00_tree_node'

class KnightPathFinder
    attr_reader :root_node

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
    end
end