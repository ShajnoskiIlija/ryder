# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/dashboard/home.html.erb', type: :view do
  it 'renders dashboard-home' do
    assign(:rented_type, ['Bicycles'])
    assign(:rented_types, ['Children'])
    render
    expect(rendered).to include('Status:', 'Current Number:', 'Items for rent', 'Items', 'Items for Children', 'Items for Adult')
  end
end