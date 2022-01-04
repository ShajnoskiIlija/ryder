# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_mailer/welcome_email.html.erb', type: :view do
  subject(:user) { create(:user) }

  it 'displays titles' do
    assign(:user, user)
    render

    expect(rendered).to include('Welcome to ryder.com,')
    expect(rendered).to include(CGI.escapeHTML(user.full_name))
    expect(rendered).to include(new_user_session_url)
  end
end
