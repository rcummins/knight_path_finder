class PolyTreeNode
    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        if @parent.nil?
            @parent = new_parent
        else
            # for reassingment, delete this node from old parent's children
            @parent.children.delete(self)
            @parent = new_parent
        end

        new_parent.children << self unless new_parent.nil?
    end
end
