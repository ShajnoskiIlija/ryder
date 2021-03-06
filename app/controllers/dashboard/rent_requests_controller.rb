# frozen_string_literal: true

module Dashboard
  class RentRequestsController < Dashboard::DashboardController
    include Pagy::Backend
    before_action :find_rent_request, only: %i[update]

    def index
      current_user_rent_items = current_user.rent_items.pluck(:id)
      @pagy, @rent_requests = pagy(RentRequest.where(rent_item_id: current_user_rent_items).pending)
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

    def update # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      if @rent_request.update(update_rent_request_params)
        if @rent_request.accepted?
          @rent_request.rent_item.update(available: false)
          reject_pending_requests(@rent_request)
          ApproveMailer.new_approve(@rent_request).deliver_now
        end

        if @rent_request.rejected?
          @rent_request.rent_item.update(available: true)
          RejectMailer.reject_email(@rent_request).deliver_now
        end

        redirect_to dashboard_rent_requests_path, notice: 'Rent Request successfully updated'
      else
        redirect_to dashboard_rent_requests_path, alert: 'Rent Request was not updated'
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
      @rent_request = RentRequest.find(params[:id])
    end

    def reject_pending_requests(rent_request)
      RentRequest.where(rent_item_id: rent_request.rent_item.id).pending.each do |rr|
        rr.reject!
        RejectMailer.reject_email(rr).deliver_now
      end
    end
  end
end
