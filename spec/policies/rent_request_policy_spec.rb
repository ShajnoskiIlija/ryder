# frozen_string_literal: true

require 'rails_helper'

describe RentRequestPolicy do
  subject { described_class.new(user, rent_request) }

  let(:rent_request) { create(:rent_request) }
  let(:user) { create(:user) }

  permissions  :create? do
    it 'allow access to view all items' do
      expect(described_class).to permit(User.new, RentRequest.new)
    end
  end

  permissions :index?, :update? do
    it 'grant index action' do
      expect(described_class).to permit(rent_request, RentRequest.all)
    end
  end
end
