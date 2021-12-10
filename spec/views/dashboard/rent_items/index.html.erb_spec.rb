# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/rent_items/index.html.erb', type: :view do
  let(:rent_item) { create(:rent_item) }

  context 'with dynamic content' do
    it 'displays a localized rent_item card' do # rubocop:disable RSpec/ExampleLength
      assign(:rent_items, [rent_item])
      assign(:pagy, Pagy.new(count: 2, page: 1))

      render

      expect(rendered).to include(rent_item.item_type.capitalize, rent_item.for_age, rent_item.condition, rent_item.user.email, rent_item.location, t('dashboard.rent_items.index.status'),
                                  t('dashboard.rent_items.index.best_for'))
      expect(rent_item.available).to be_in([true, false])
    end
  end
end
