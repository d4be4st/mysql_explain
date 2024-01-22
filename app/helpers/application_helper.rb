# frozen_string_literal: true

module ApplicationHelper
  include ActiveSupport::NumberHelper

  def bg(time) # rubocop:disable Metrics/MethodLength
    return 'bg-white' if time < 500

    case time
    when 500..1000
      'bg-red-200'
    when 1000..5_000
      'bg-red-300'
    when 5000..10_000
      'bg-red-400'
    else
      'bg-red-500'
    end
  end
end
