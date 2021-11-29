# frozen_string_literal: true

module Dashboard
  class RentRequestsController < Dashboard::DashboardController
    def index
      current_user_rent_items = current_user.rent_items.pluck(:id)
      @rent_requests = RentRequest.where(rent_item_id: current_user_rent_items)
    end

    def create
      @rent_request = RentRequest.new(rent_request_params)
      @rent_request.user_id = current_user.id
      if @rent_request.save
        redirect_to rent_items_path, notice: 'Succesfully requested a Rent'
        @rent_request.rent_item.available = false
      else
        redirect_to root_path, alert: 'There was a problem, please try again'
      end
    end

    def update
      @rent_request = RentRequest.find(params[:id])
      if @rent_request.update(rent_request_params)
        redirect_to dashboard_rent_requests_path, notice: 'Rent Request successfully updated'
      else
        redirect_to dashboard_rent_requests_path, alert: 'Rent Request was not updated '
      end
    end

    private

    def rent_request_params
      params.require(:rent_request).permit(:status, :user_id, :rent_item_id)
    end

    def find_rent_request
      @rent_request = current_user.rent_requests.find(params[:id])
    end
  end
end
