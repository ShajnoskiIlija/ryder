# frozen_string_literal: true

class RentItemsController < ApplicationController
  before_action :scope_rent_items, only: :index
  include Pagy::Backend

  def index
    @pagy, @rent_items = pagy(@rent_items)
  end

  def show
    @rent_item = RentItem.find(params[:id])
  end

  private

  def scope_rent_items
    @rent_items = if params[:rent_type]
                    RentItem.rent_item_per_type(params[:rent_type])
                  else
                    RentItem.not_my_rentals(params[:current_user]).available_rentals.order(created_at: :desc)
                  end
  end
end
