# frozen_string_literal: true

require 'rails_helper'

describe RentItemsController, type: :controller do
  let!(:rent_item) { create(:rent_item, available: true) }
  let(:current_user) { create(:user) }

  before { sign_in current_user }

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'custom method' do
    context 'with params' do
      it 'rent items' do
        get :index, params: { available: true }
        expect(assigns(:rent_items)).to include(rent_item)
      end
    end

    context 'with wrong params' do
      it 'rent items' do
        get :index, params: { available: false }
        expect(assigns(:rent_items)).not_to include(rent_item.available)
      end
    end

    context 'with current user params' do
      it 'rent items' do
        get :index, params: { user_id: current_user }
        expect(assigns(:rent_items)).not_to include(rent_item.user_id)
      end
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get :show, params: { id: rent_item }
      expect(response).to have_http_status(:success)
    end
  end
end
