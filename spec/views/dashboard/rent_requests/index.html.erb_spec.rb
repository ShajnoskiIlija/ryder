# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_requests/index.html.erb' do # rubocop:disable RSpec/DescribeClass
  let(:rent_request) { create(:rent_request) }
  let(:rent_items) { create(:rent_item) }

  before do
    assign(:rent_items) { create(rent_item) }
    assign(:rent_requests, [request])
  end

  context 'with dynamic content' do
    it 'displays a rent_requests' do
      render

      expect(rendered).to include(request.rent_item.item_type, request.user.first_name, request.user.phone_number, request.user.email, request.user.last_name, request.user.address, 'From', 'Phone',
                                  'Requesting')
    end
  end
end
