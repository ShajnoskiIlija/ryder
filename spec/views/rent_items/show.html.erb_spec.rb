# frozen_string_literal: true

require 'rails_helper'

describe 'rent_items/show.html.erb', type: :view do
  let(:item_type) { create(:rent_item) }
  let(:rent_item) { create(:rent_item) }
  let(:user) { create(:user) }

  before do
    assign(:rent_item, rent_item)
    assign(:rent_item, item_type)
    assign(:user, user)
  end

  it 'displays titles' do
    render
    expect(rendered).to include('Owner:', 'Best for:', 'Call Me:')
  end

  it 'displays a cards' do
    render
    expect(rendered).to include(rent_item.condition)
  end
end
