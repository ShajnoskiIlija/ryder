# frozen_string_literal: true

module Dashboard
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :rents, only: %i[home]
    before_action :second_rents, only: %i[home]

    layout 'dashboard'

    def home
      @count_rent = current_user.rent_items.size
    end

    private

    def rents
      @bicycle = RentItem.bicycle(current_user, params[:id]).size
      @elec_scooter = RentItem.scooter(current_user, params[:id]).size
    end

    def second_rents
      @summer_eq = RentItem.summer(current_user, params[:id]).size
      @winter_eq = RentItem.winter(current_user, params[:id]).size
    end
  end
end
