# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RentItems', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/rent_items/index'
      expect(response).to have_http_status(:success)
    end
  end
end
