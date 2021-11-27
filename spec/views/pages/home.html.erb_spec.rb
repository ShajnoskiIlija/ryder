# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/home.html.erb', type: :view do
  let(:item_type) { create(:rent_item) }

  it 'displays titles' do
    assign(:rent_item_types, [item_type])
    render

    expect(rendered).to include('© Copyright 2021 Ryder, All rights reserved.', 'Get Started', 'Rentals', 'Welcome',
                                'Contact us', 'Start here and now', 'Rentals that will fit your needs')
  end

  it 'renders contact info' do
    assign(:rent_item_types, [item_type])
    render

    expect(rendered).to include('333-555 Radozda, Struga, Macedonia', 'Main Office', 'Tel: 222-333-222', 'Radozda, Struga', 'Here you can contact us, share your needs and  suggestions.')
  end
end
