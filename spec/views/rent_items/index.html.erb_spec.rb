# frozen_string_literal: true

require 'rails_helper'

describe 'rent_items/index.html.erb', type: :view do
  let(:item) { create(:rent_item) }

  before do
    assign(:rent_items, [item])
  end

  it 'displays titles' do
    render
    expect(rendered).to include('Condition:', 'For:', 'Type:', "You're looking for:")
  end

  it 'displays a cards' do
    render
    expect(rendered).to include(item.condition, item.for_age, item.item_type, item.location)
  end
end
