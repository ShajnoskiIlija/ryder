# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_requests/index.html.erb' do # rubocop:disable RSpec/DescribeClass
  let(:rent_request) { create(:rent_request) }
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
                                  'From',
                                  'Phone',
                                  'Requesting')
    end
  end
end
