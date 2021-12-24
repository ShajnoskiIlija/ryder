# frozen_string_literal: true

require 'rails_helper'

describe 'rent_items/show.html.erb', type: :view do
  let(:rent_item) { create(:rent_item) }

  before do
    assign(:rent_item, rent_item)
  end

  it 'displays titles' do
    render
    expect(rendered).to include(t('rent_items.show.call'), t('rent_items.show.for_age'), t('rent_items.show.owner'))
  end

  it 'displays a cards' do
    render
    expect(rendered).to include(rent_item.condition, rent_item.item_type, rent_item.for_age, rent_item.user.phone_number, rent_item.location,
                                rent_item.user.email)
    expect(rendered).to include(CGI.escapeHTML(rent_item.user.last_name))
    expect(rendered).to include(CGI.escapeHTML(rent_item.user.first_name))
  end
end
