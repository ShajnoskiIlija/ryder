# frozen_string_literal: true

require 'rails_helper'

describe RentItemPolicy do
  subject { described_class.new(user, rent_item) }

  let(:rent_item) { create(:rent_item) }

  permissions :update?, :edit?, :destroy?, :new?, :create? do
    it 'allowes access' do
      expect(described_class).to permit(User.new, RentItem.new)
    end
  end

  permissions :index? do
    it 'not permitted' do
      expect(described_class).to permit(RentItem.all)
    end
  end
end
