# frozen_string_literal: true

require 'rails_helper'

describe 'rent_items/show.html.erb', type: :view do
  let(:rent_item) { create(:rent_item) }

  before do
    assign(:rent_item, rent_item)
  end

  it 'displays titles' do
    render
    expect(rendered).to include('Owner:', 'Best for:', 'Call Me:')
  end

  it 'displays a cards' do
    render
    expect(rendered).to include(rent_item.condition, rent_item.item_type, rent_item.for_age, rent_item.user.phone_number, rent_item.user.last_name, rent_item.user.first_name, rent_item.user.address,
                                rent_item.user.email)
  end
end