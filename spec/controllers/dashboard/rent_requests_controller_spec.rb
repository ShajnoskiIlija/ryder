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

  describe 'post /create,' do
    it 'returns http success' do
      post :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'put /update' do
    let(:rent_request) { create(:rent_request, user: user) }

    context 'with valid attributes' do
      it 'updates requests' do
        put :update, params: { id: rent_request.id, rent_request: { status: 'Pending' } }
        allow(rent_request).to receive(:status).and_return('Pending')
      end
    end

    context 'with invalid attributes' do
      it 'does not updates request' do
        put :update, params: { id: rent_request.id, rent_request: { status: '' } }
        expect(response).not_to be_redirect
      end
    end
  end
end
