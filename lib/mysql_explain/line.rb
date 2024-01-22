# frozen_string_literal: true

module MysqlExplain
  class Line
    attr_reader :line

    def initialize(line)
      @line = line
    end

    def index
      (line =~ /\S/) / 4
    end

    def desc
      ('&nbsp;' * index * 2) + parsed['desc']
    end

    def avg_rows
      parsed['rows'].to_f
    end

    def avg_time
      parsed['total_time'].to_f
    end

    def loops
      parsed['loops'].to_i
    end

    private

    def parsed
      @parsed ||=
        line.match(/-> (?<desc>.*)  .*actual time=\S+\.\.(?<total_time>\S+) rows=(?<rows>\S+) loops=(?<loops>\S+)/)&.named_captures ||
        line.match(/-> (?<desc>.*)/).named_captures
    end
  end
end
