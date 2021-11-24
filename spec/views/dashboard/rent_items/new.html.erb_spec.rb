# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_items/new.html.erb', type: :view do
  let(:rent_item) { create(:rent_item) }

  it 'display rent item form' do # rubocop:disable RSpec/ExampleLength
    assign(:rent_item, RentItem.new)

    render

    expect(rendered).to include(rent_item.item_type)
    expect(rendered).to include(rent_item.condition)
    expect(rendered).to include(rent_item.for_age)
    expect(rent_item.available).to be_in([true, false])
  end
end
