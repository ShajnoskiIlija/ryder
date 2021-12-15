ActionMailer::Base.smtp_settings = {
    domain: 'YOUR_DOMAIN.COM',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       Rails.application.credentials.dig(:sendgrid, :api_key)
  }