require 'byebug'

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

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise('Node is not a child') if child_node.parent.nil?
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if @value == target_value

        @children.each do |child|
            search_child = child.dfs(target_value)
            return search_child unless search_child.nil?
        end

        return nil
    end

    def inspect
        summary = ''
        summary += "value: #{@value}, "
        summary += "parent: #{@parent.value}, "
        summary += 'children: ['
        summary += @children.map{ |child| child.value }.join(', ')
        summary += ']'

        return summary
    end
end
