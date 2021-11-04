# frozen_string_literal: true

require 'rails_helper'

describe Dashboard::RentItemsController, type: :controller do
  let(:rent_item) { create :rent_item }
  let!(:user) { create :user }

  before { sign_in user }

  describe 'GET dashboard/rent_items' do
    it 'has a 200 status code' do
      get :index, params: { id: rent_item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET dashboard/posts/:id' do
    let(:rent_item) { create(:rent_item, user: user) }

    it 'has a 200 status code' do
      get :show, params: { id: rent_item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create rent item' do
    context 'with valid attributes' do
      it 'creates new rent item' do
        expect do
          post :create,
               params: { rent_item: { item_type: 'Bicycle', Condition: 'New', for_age: 'Children', rent_item_id: create(:rent_item).id } }
        end.to change(RentItem, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnt create new post' do
        expect do
          post :create,
               params: { rent_item: { item_type: '', Condition: '', for_age: '' } }
        end.to change(RentItem, :count).by(0)
      end
    end
  end
end
