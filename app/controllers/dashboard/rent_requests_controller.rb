# frozen_string_literal: true

module Dashboard
  class RentRequestsController < Dashboard::DashboardController
    include Pagy::Backend
    def index
      current_user_rent_items = current_user.rent_items.pluck(:id)
      @pagy, @rent_requests = pagy(RentRequest.where(rent_item_id: current_user_rent_items))
    end

    def create
      @rent_request = RentRequest.new(create_rent_request_params)
      @rent_request.user_id = current_user.id
      if @rent_request.save
        redirect_to rent_items_path, notice: 'Succesfully requested a Rent'
      else
        redirect_to root_path, alert: 'There was a problem, please try again'
      end
    end

    def update
      @rent_request = RentRequest.find(params[:id])
      if @rent_request.update(update_rent_request_params)
        @rent_request.rent_item.update(available: false) if @rent_request.status == 'accepted'
        @rent_request.rent_item.update(available: true) if @rent_request.status == 'rejected'
        redirect_to dashboard_rent_requests_path, notice: 'Rent Request successfully updated'
      else
        redirect_to dashboard_rent_requests_path, alert: 'Rent Request was not updated '
      end
    end

    private

    def create_rent_request_params
      params.require(:rent_request).permit(:rent_item_id)
    end

    def update_rent_request_params
      params.require(:rent_request).permit(:status)
    end

    def find_rent_request
      @rent_request = current_user.rent_requests.find(params[:id])
    end
  end
end
