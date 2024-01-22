# frozen_string_literal: true

module MysqlExplain
  class Node
    include Enumerable

    attr_accessor :parent
    attr_reader :children
    attr_reader :value
    attr_accessor :id

    delegate :avg_time, :avg_rows, :loops, :desc, :index, to: :value

    def initialize(value)
      @value = value
      @id = nil
      @parent = nil
      @children = []
    end

    def each(&block)
      block.call(self)
      children.each do |child|
        child.each(&block)
      end
    end

    def children_ids
      map(&:id) - [id]
    end

    def add_child(child)
      @children << child
      child.parent = self
    end

    def my_time
      (total_time - children.map(&:total_time).sum).round(2)
    end

    def total_time
      (avg_time * loops).to_i
    end

    def rows
      (avg_rows * loops).to_i
    end
  end
end
