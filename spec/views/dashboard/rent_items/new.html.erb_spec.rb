# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_items/new.html.erb' do # rubocop:disable RSpec/DescribeClass
  let(:rent_item) { create(:rent_item) }

  it 'display rent item form' do
    assign(:rent_item, RentItem.new)

    render

    expect(rendered).to include(rent_item.item_type)
    expect(rendered).to include(rent_item.condition)
    expect(rendered).to include(rent_item.for_age)
  end
end
