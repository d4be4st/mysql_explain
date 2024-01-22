# frozen_string_literal: true

class PlansController < ApplicationController
  def show
    @plan = Plan.new
  end

  def create
    plan = Plan.new(permitted_params)
    @tree = MysqlExplain::Parser.new(plan.input).parse
  end

  private

  def permitted_params
    params.require(:plan).permit(:input)
  end
end
