# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_items/index.html.erb' do # rubocop:disable RSpec/DescribeClass
  let(:rent_item) { create(:rent_item) }

  context 'with dynamic content' do
    it 'displays a rent_item card' do
      assign(:rent_items, [rent_item])
      assign(:pagy, Pagy.new(count: 2, page: 1))

      render

      expect(rendered).to include(rent_item.item_type.capitalize, rent_item.for_age, rent_item.condition, rent_item.user.email, rent_item.location, 'Best for', 'Status')
      expect(rent_item.available).to be_in([true, false])
    end
  end
end
