# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/home.html.erb', type: :view do
  let(:rent_item) { create(:rent_item) }

  before { assign(:rent_item_types, [rent_item.item_type]) }

  it 'displays localized titles' do
    render

    expect(rendered).to include('© Copyright 2021 Ryder, All rights reserved.', t('pages.home.get_started'), t('pages.home.welcome'),
                                t('pages.home.contact_us'), t('pages.home.text_one'))
  end

  it 'renders contact info' do
    render

    expect(rendered).to include('333-555 Radozda, Struga, Macedonia', 'Main Office', 'Tel: 222-333-222', 'Radozda, Struga', t('pages.home.message_one'))
  end
end
