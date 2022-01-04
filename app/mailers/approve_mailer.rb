# frozen_string_literal: true

class ApproveMailer < ApplicationMailer
  default from: 'rydewithus22@gmail.com'

  def new_approve(rent_request)
    @rent_request = rent_request
    @user = rent_request.user

    mail to: @user.email,
         subject: 'Your request is approved'
  end
end
