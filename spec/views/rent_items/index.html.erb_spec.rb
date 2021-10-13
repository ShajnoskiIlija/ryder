# frozen_string_literal: true

require 'rails_helper'

describe 'rent_items/index.html.erb', type: :view do
  let(:rent_type) { create(:rent_type) }

  before do
    assign(:rent_type, [item])
    it 'displays titles' do
      render
      expect(rendered).to include("You're looking for:", "You didn't add category!", 'Choose one category please:', 'Condition:', 'For:', 'Type:')
    end

    context 'with dynamic content' do
      it 'displays a cards' do
        render
        expect(rendered).to include(item.condition, item.for_age, item.type, item.location)
      end
    end
  end
end
