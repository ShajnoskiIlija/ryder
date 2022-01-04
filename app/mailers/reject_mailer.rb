# frozen_string_literal: true

class RejectMailer < ApplicationMailer
  default from: 'rydewithus22@gmail.com'

  def reject_email(rent_request)
    @rent_request = rent_request
    @user = @rent_request.user

    mail to: @user.email,
         subject: 'Unfortunately your request was not accepted by the owner'
  end
end
