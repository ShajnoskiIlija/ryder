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

  describe 'POST create rent_item' do
    let(:rent_request) { create(:rent_request) }

    context 'with valid attributes' do
      it 'creates new rent_item' do
        expect do
          post :create,
               params: { rent_item: { location: 'Skopje', condition: 'New', for_age: 'Adult', item_type: 'Bicycle', available: true } }
        end.to change(RentItem, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnt create new post' do
        expect do
          post :create,
               params: { rent_item: { location: '', condition: '', for_age: '', item_type: '', available: 'true' } }
        end.to change(RentItem, :count).by(0)
      end
    end
  end

  describe 'GET dashboard/posts/:id' do
    let(:rent_item) { create(:rent_item, user: user) }

    it 'has a 200 status code' do
      get :show, params: { id: rent_item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET dashboard/posts/:id/edit' do
    let(:rent_item) { create(:rent_item, user: user) }

    it 'has a 200 status code' do
      get :edit, params: { id: rent_item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH create_item' do
    let(:rent_item) { create(:rent_item, user: user) }

    context 'with valid attributes' do
      it 'updates rent_item' do # rubocop:disable RSpec/ExampleLength
        patch :update,
              params: { id: rent_item, rent_item: { location: 'Skopje', condition: 'New', for_age: 'Adult', item_type: 'Bicycle', available: true } }
        allow(rent_item).to receive(:location).and_return('Skopje')
        allow(rent_item).to receive(:condition).and_return('New')
        allow(rent_item).to receive(:for_age).and_return('Adult')
        allow(rent_item).to receive(:item_type).and_return('Bicycle')
        allow(rent_item).to receive(:available).and_return(true)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the rent_item' do
        patch :update,
              params: { id: rent_item, rent_item: { location: '', condition: '', for_age: '', item_type: '', available: '' } }
        expect(response).not_to be_redirect
      end
    end
  end
end
