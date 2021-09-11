# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/home.html.erb', type: :view do
  it 'displays titles' do
    render

    expect(rendered).to include('RYDER', 'BICYCLE', 'ELECTRIC SCOOTER', 'WINTER EQUIPMENT', 'SUMMER EQUIPMENT', 'Get in touch', 'About', 'FIND', 'Contact')
  end

  it 'renders contact info' do
    render

    expect(rendered).to include('rydewithus@gmail.com', 'Send Message', '+2499999666600', 'Radozda, Struga, MKD')
  end
end
