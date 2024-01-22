# frozen_string_literal: true

module MysqlExplain
  class Parser
    attr_reader :input
    attr_reader :current_node
    attr_reader :tree

    def initialize(input)
      @input = input
      @current_node = nil
    end

    def parse
      input.strip.split("\n").each do |line|
        handle_line(line)
      end
      tree
    end

    private

    def handle_line(line)
      instruction = Line.new(line)
      node = Node.new(instruction)

      if current_node.nil?
        new_tree(node)
      else
        handle_diff(instruction.index - current_node.index, node)
      end
      @current_node = node
    end

    def new_tree(node)
      @tree = Tree.new(node)
    end

    def handle_diff(diff, node)
      if diff.positive?
        add_child(node)
      else
        parent = tree.find_parent(current_node, diff.abs + 1)
        tree.add_node(parent, node)
      end
    end

    def add_child(node)
      tree.add_node(current_node, node)
    end
  end
end
