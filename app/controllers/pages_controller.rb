# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def create_contact
    @contact = Contact.new
    if @contact.save
      redirect_to root_path

    else
      render :home
    end
  end
end
