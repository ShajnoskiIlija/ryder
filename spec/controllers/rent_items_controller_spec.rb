# frozen_string_literal: true

require 'rails_helper'

describe RentItemsController, type: :controller do
  let(:rent_item) { create(:rent_item, item_type: 'bicycle') }

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'custom method' do
    context 'with params' do
      it ' rent items  ' do
        get :index, params: { rent_type: 'bicycle' }
        expect(assigns(:rent_items)).to include(rent_item)
      end
    end

    context 'with wrong params' do
      it ' rent items  ' do
        get :index, params: { rent_type: 'summer equipment' }
        expect(assigns(:rent_items)).not_to include(rent_item)
      end
    end
  end
end
