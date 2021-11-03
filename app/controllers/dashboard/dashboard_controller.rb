# frozen_string_literal: true

module Dashboard
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :rents, only: %i[home]

    layout 'dashboard'

    def home
      @count_rent = current_user.rent_items.size
    end

    private

    def rents
      @rented_type = current_user.rent_items.pluck(:item_type)
      @rented_types = current_user.rent_items.pluck(:for_age)
    end
  end
end
