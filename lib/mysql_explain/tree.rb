# frozen_string_literal: true

module MysqlExplain
  class Tree
    attr_reader :root
    attr_reader :id

    def initialize(root)
      @id = 1
      root.id = id
      @root = root
    end

    def each(&block)
      root.each(&block)
    end

    def add_node(node, child)
      @id += 1
      child.id = id
      node.add_child(child)
    end

    def find_parent(node, index)
      index.times do
        node = node.parent
      end
      node
    end
  end
end
