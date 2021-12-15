ActionMailer::Base.smtp_settings = {
    ActionMailer::Base.smtp_settings = {
        address: 'rydewithus22@gmail.com',
        port: 587,
        domain: 'ryder-staging.herokuapp.com',
        user_name: ENV['Ryder'],
        password: ENV['@Password-rydewithus'],
        authentication: :login,
        enable_starttls_auto: :true
    }
}