# frozen_string_literal: true

module MysqlExplain
  class Loop
    def run
      input = File.read('plan.txt')
      parsed = Parser.new(input).parse
      printer = Printer.new(parsed)
      printer.print
    end

    private

    def prompt
      @prompt ||= TTY::Prompt.new
    end
  end
end
