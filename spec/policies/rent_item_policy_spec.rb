# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentItemPolicy do
  subject { described_class.new(user, rent_item) }

  let(:rent_item) { create(:rent_item) }
  let(:user) { create(:user) }

  permissions :update?, :create?, :destroy?, :edit? do
    it 'denies access if user is not the correct user' do
      expect(described_class).not_to permit(user)
    end
  end
end
