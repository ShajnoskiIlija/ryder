# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET home' do
    it 'has a success status code' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
end
