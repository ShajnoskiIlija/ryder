# frozen_string_literal: true

require 'rails_helper'

describe RentItemsController, type: :controller do
  let(:rent_item) { create(:rent_item, item_type: 'Bicycle') }

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'custom method' do
    context 'with params' do
      it 'rent items' do
        get :index, params: { rent_type: 'Bicycle' }
        expect(assigns(:rent_items)).to include(rent_item)
      end
    end

    context 'with wrong params' do
      it 'rent items' do
        get :index, params: { rent_type: 'Summer Equipment' }
        expect(assigns(:rent_items)).not_to include(rent_item)
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
