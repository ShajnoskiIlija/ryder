# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/about.html.erb', type: :view do
  it 'displays localized titles' do
    render

    expect(rendered).to include(t('pages.about.who_are_we'), t('pages.about.grow_together'), t('pages.about.message_about'), t('pages.about.start_here'), t('pages.about.grow_together'))
  end
end
