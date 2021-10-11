# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET home' do
    it 'has a success status code' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET about' do
    it 'has a success status code' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create_contact' do
    context 'with valid attributes' do
      it 'creates new contact' do
        expect do
          post :create_contact,
               params: { contact: { full_name: 'Any Name', email: 'johndoe@test.com',
                                    message: 'Sentence is here.' } }
        end.to change(Contact, :count).by(1)
      end
    end
  end
end
