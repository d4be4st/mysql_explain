# frozen_string_literal: true

module MysqlExplain
  class Printer
    def initialize(tree)
      @tree = tree
    end

    def print # rubocop:disable Metrics/MethodLength
      @tree.each do |node|
        table << [
          node.id,
          node.my_time.negative? ? 0 : node.my_time,
          node.total_time,
          node.loops,
          node.rows,
          node.desc[0..300]
        ]
      end
      puts table.render(:ascii)
    end

    private

    def table
      @table ||= TTY::Table.new(
        header: ['id', 'my time', 'total time', 'loops', 'rows', 'desc'],
        resize: true
      )
    end
  end
end
