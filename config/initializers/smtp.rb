ActionMailer::Base.smtp_settings = {
    domain: 'rydewithus22@gmail.com',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       ENV['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']
  }