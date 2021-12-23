# frozen_string_literal: true

class RejectMailer < ApplicationMailer
  default from: 'rydewithus22@gmail.com'

  def reject_email(rent_request)
    @rent_request = rent_request
    @user = User.find_by(id: @rent_request.status == 'rejected')

    mail to: @rent_request.user.email,
         subject: 'Unfortunately your request was not accepted by the owner'
  end
end
