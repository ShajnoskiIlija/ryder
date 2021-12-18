# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'rydewithus22@gmail.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Ryder')
  end
end
