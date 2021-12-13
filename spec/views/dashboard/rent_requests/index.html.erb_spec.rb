# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_requests/index.html.erb', type: :view do
  let(:rent_request) { create(:rent_request, status: 'pending') }
  let(:rent_items) { create(:rent_item) }

  before do
    assign(:rent_requests, [rent_request])
    assign(:pagy, Pagy.new(count: 2, page: 1))
  end

  context 'with dynamic content' do
    it 'displays a rent_requests' do # rubocop:disable RSpec/ExampleLength
      render

      expect(rendered).to include(rent_request.rent_item.item_type,
                                  rent_request.user.first_name,
                                  rent_request.user.phone_number,
                                  rent_request.user.last_name,
                                  rent_request.status.capitalize,
                                  rent_request.rent_item.location,
                                  'From',
                                  'Phone',
                                  'Requesting')
    end
  end
end
