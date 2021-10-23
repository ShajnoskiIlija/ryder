# frozen_string_literal: true

module Dashboard
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    layout 'dashboard'

    def home; end
  end
end
