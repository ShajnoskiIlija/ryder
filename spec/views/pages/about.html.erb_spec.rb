# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/about.html.erb', type: :view do
  it 'displays titles' do
    render

    expect(rendered).to include('Who are we ?', 'Help us to grow together')
  end
end
