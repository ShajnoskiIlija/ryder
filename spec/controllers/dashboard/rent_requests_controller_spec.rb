# frozen_string_literal: true

require 'rails_helper'

describe Dashboard::RentRequestsController, type: :controller do
  let(:rent_request) { create(:rent_request, status: 'pending') }
  let!(:user) { create :user }

  before { sign_in user }

  describe 'GET /index,' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post /create,' do
    context 'with vallid attributes' do
      it 'creates new request' do
        expect do
          post :create,
               params: { rent_request: { id: rent_request.id, status: 'pending' } }
        end.to change(RentRequest, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnt create new request' do
        expect do
          post :create,
               params: { rent_request: { status: '' } }
        end.to change(RentItem, :count).by(0)
      end
    end
  end

  describe 'put /update' do
    let(:rent_request) { create(:rent_request, user: user, status: 'pending') }

    context 'with valid attributes' do
      it 'updates requests' do
        put :update, params: { id: rent_request.id, rent_request: { status: 'pending' } }
        allow(rent_request).to receive(:status).and_return('Pending')
      end
    end

    context 'with invalid attributes' do
      it 'does not updates request' do
        put :update, params: { id: rent_request.id, rent_request: { status: '' } }
        expect(response).to be_redirect
      end
    end
  end
end
