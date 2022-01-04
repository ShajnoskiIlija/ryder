# frozen_string_literal: true

class AutoRejectJob < ApplicationJob
  queue_as :default

  def perform(*args); end
end
