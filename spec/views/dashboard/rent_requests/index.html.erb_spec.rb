# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_requests/index.html.erb', type: :view do
  let(:rent_request) { create(:rent_request, status: 'pending') }
  let(:rent_items) { create(:rent_item) }

  before do
    assign(:rent_requests, [rent_request])
  end

  context 'with dynamic content' do
    it 'displays a rent_requests' do # rubocop:disable RSpec/ExampleLength
      render

      expect(rendered).to include(rent_request.rent_item.item_type,
                                  rent_request.user.first_name,
                                  rent_request.user.phone_number,
                                  rent_request.user.last_name,
                                  rent_request.user.address,
                                  rent_request.status.capitalize,
                                  'From',
                                  'Phone',
                                  'Requesting')
    end
  end
end
