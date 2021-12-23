# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reject_mailer/reject_email.html.erb', type: :view do
  let(:rent_request) { create(:rent_request) }
  let(:rent_item) { create(:rent_item) }

  it 'displays titles' do
    assign(:rent_request, rent_request)
    render

    expect(rendered).to include('We want to inform you that your request is not approved ')
    expect(rendered).to include(rent_request.rent_item.item_type)
  end
end
