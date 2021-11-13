# frozen_string_literal: true

require 'rails_helper'

describe Dashboard::RentRequestsController, type: :controller do
  let(:rent_request) { create(:rent_request) }
  let!(:user) { create :user }

  before { sign_in user }

  describe 'GET /index,' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create,' do
    it 'returns http success' do
      post :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    xit 'returns http success' do # xit == pending
      patch :update
      expect(response).to have_http_status(:success)
    end
  end
end
