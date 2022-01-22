# frozen_string_literal: true

module Dashboard
  class RentItemsController < Dashboard::DashboardController
    include Pagy::Backend

    before_action :find_rent_item, only: %i[show edit update]

    def index
      @pagy, @rent_items = pagy(current_user.rent_items)
      authorize @rent_item
    end

    def show; end

    def new
      authorize @rent_item
      @rent_item = RentItem.new
    end

    def create
      @rent_item = RentItem.new(rent_item_params)
      @rent_item.user_id = current_user.id
      authorize @rent_item
      if @rent_item.save
        redirect_to @rent_item, notice: 'Rent Item has been successfully created!'
      else
        render :new
      end
    end

    def edit
      authorize @rent_item
    end

    def update
      authorize @rent_item
      if @rent_item.update(rent_item_params)
        redirect_to dashboard_rent_items_path, notice: 'Rent Item has been updated!'
      else
        render :edit
      end
    end

    def destroy
      authorize @rent_item
      @rent_item.destroy

      redirect_to rent_items_path
    end

    private

    def rent_item_params
      params.require(:rent_item).permit(:condition, :for_age, :item_type, :location, :available)
    end

    def find_rent_item
      @rent_item = RentItem.my_rentals(current_user).first
    end
  end
end
