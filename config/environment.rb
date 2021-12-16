# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    domain: 'rydewithus22@gmail.com',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       ENV['SENDGRID_API_KEY']
  }
