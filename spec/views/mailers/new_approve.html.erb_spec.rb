# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'approve_mailer/new_approve.html.erb', type: :view do
  let(:rent_request) { create(:rent_request) }
  let(:rent_item) { create(:rent_item) }

  it 'displays titles' do
    assign(:rent_request, rent_request)
    render

    expect(rendered).to include('Your request for', 'that is suitable for:', 'is approved by the owner', 'You can pick up from this location:', 'or call on this number:', 'with current condition',
                                'Thank you and have a great day!')
    expect(rendered).to include(rent_request.rent_item.item_type, rent_request.rent_item.location, rent_request.rent_item.condition, rent_request.user.phone_number)
  end
end
