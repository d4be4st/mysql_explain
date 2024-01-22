# frozen_string_literal: true

require_relative 'mysql_explain/line'
require_relative 'mysql_explain/loop'
require_relative 'mysql_explain/printer'
require_relative 'mysql_explain/parser'
require_relative 'mysql_explain/tree'
require_relative 'mysql_explain/node'
require_relative 'mysql_explain/version'

require 'tty-prompt'
require 'tty-table'

module MysqlExplain
  def self.loop
    Loop.new.run
  end
end

MysqlExplain.loop
