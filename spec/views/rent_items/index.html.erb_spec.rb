# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rent_items/index.html.erb', type: :view do
  it 'displays titles' do
    render

    expect(rendered).to include('Here you can find all items for rent')
  end
end
