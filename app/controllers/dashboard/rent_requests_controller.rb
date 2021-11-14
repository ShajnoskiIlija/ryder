# frozen_string_literal: true

module Dashboard
  class RentRequestsController < Dashboard::DashboardController
    def index
      @rent_requests = RentRequest.all
    end

    def create; end

    def update; end
  end
end
