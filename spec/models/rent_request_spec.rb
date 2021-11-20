# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentRequest, type: :model do
  let(:user) { create(:user) }
  let(:rent_request) { create(:rent_request) }

  describe 'associations' do
    context 'with relations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to belong_to(:rent_item) }
    end
  end

  describe 'inclusion of values' do
    context 'when creating new record, status is pending' do
      it do
        expect(rent_request.status).to eq('pending')
      end

      it 'is not accepted or rejected' do
        expect(rent_request.status).not_to include((RentRequest::UPDATE_STATUSES).join(', '))
      end
    end

    context 'when updating record, status can be either accepted or rejected' do
      it 'is accepted' do
        rent_request.update(status: 'accepted')
        expect(rent_request.status).to include('accepted')
      end

      it 'is rejected' do
        rent_request.update(status: 'rejected')
        expect(rent_request.status).to include('rejected')
      end
    end
  end
end
