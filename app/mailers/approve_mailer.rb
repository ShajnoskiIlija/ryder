# frozen_string_literal: true

class ApproveMailer < ApplicationMailer
  default from: 'rydewithus22@gmail.com'

  def new_approve(rent_request)
    @rent_request = rent_request
    @user = User.find_by(id: @rent_request.status == 'accepted')

    mail to: @rent_request.user.email,
         subject: 'Your request is approved'
  end
end
