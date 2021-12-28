# frozen_string_literal: true

require 'rails_helper'

describe Dashboard::RentRequestsController, type: :controller do
  let(:rent_request) { create(:rent_request) }
  let!(:user) { create :user }

  before { sign_in user }

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    context 'when instance var contains expected results' do
      before { create_list(:rent_item, 4, user: user) }

      it 'returns correct records' do
        get :index
        current_user_rent_items = user.rent_items.pluck(:id)
        expect(assigns(:rent_requests)).to match_array(RentRequest.where(rent_item_id: current_user_rent_items))
      end
    end
  end

  describe 'post /create' do
    context 'with vallid attributes' do
      let!(:new_rent_item) { create :rent_item }

      it 'creates new request' do
        expect do
          post :create,
               params: { rent_request: { rent_item_id: new_rent_item.id } }
        end.to change(RentRequest, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it "doesn't create new request" do
        expect do
          post :create,
               params: { rent_request: { rent_item_id: 'frdfd' } }
        end.to change(RentItem, :count).by(0)
      end
    end

    context 'with correct user' do
      let!(:new_rent_item) { create :rent_item }

      before { post :create, params: { rent_request: { rent_item_id: new_rent_item.id } } }

      it 'checks if rent request user is current_user' do
        expect(RentRequest.last.user).to eq(user)
      end
    end

    context 'with correct status' do
      let!(:new_rent_item) { create :rent_item }

      before { post :create, params: { rent_request: { rent_item_id: new_rent_item.id } } }

      it 'checks if rent request user is current_user' do
        expect(RentRequest.last.status).to eq('pending')
      end
    end
  end

  describe 'put /update' do
    let(:rent_request) { create(:rent_request, user: user) }

    context 'when accepts request' do
      before do
        put :update, params: { id: rent_request.id, rent_request: { status: 'accepted' } }
        rent_request.reload
      end

      it 'sends an email' do
        expect(ApproveMailer.new_approve(rent_request)).to change(ActionMailer::Base.deliveries(:count)).by(1)
      end

      it 'updates status to accepted' do
        expect(rent_request.status).to eq('accepted')
      end

      it 'rent item should not be available' do
        rent_request.rent_item.reload
        expect(rent_request.rent_item.available).to eq(false)
      end
    end

    context 'when rejects request' do
      before do
        put :update, params: { id: rent_request.id, rent_request: { status: 'rejected' } }
        rent_request.reload
      end

      it 'updates status to rejected' do
        expect(rent_request.status).to eq('rejected')
      end

      it 'rent item should be available' do
        rent_request.rent_item.reload
        expect(rent_request.rent_item.available).to eq(true)
      end
    end

    context 'when status is not correct' do
      before do
        put :update, params: { id: rent_request.id, rent_request: { status: 'dfffdd' } }
        rent_request.reload
      end

      it 'is false' do
        expect(rent_request.status).to eq('pending')
      end

      it { expect(response).to be_redirect }
    end
  end
end
