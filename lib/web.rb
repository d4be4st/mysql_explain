# frozen_string_literal: true

require 'js'
require 'json'

document = JS.global[:document]

document.getElementById('plan-form').addEventListener('submit') do |event|
  event.preventDefault
  input = document.getElementById('plan-input')[:value].to_s
  puts input
  MysqlExplain::Parser.new(input).parse
end
