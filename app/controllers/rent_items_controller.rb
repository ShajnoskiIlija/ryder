# frozen_string_literal: true

class RentItemsController < ApplicationController
  before_action :scope_rent_items, only: :index

  def index; end

  def show
    @rent_item = RentItem.find(params[:id])
  end

  private

  def scope_rent_items
    @rent_items = if params[:rent_type]
                    RentItem.rent_item_per_type(params[:rent_type])
                  else
                    RentItem.last(20)
                  end
  end
end