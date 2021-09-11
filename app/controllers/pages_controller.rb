# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render :home
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :message, :email)
  end
end
