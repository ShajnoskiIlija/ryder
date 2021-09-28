# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentItem, type: :model do
  describe 'factories' do
    subject(:rent_item) { create(:rent_item) }

    describe 'validations' do
      it { expect(rent_item).to be_valid }
      it { expect(rent_item).to validate_presence_of(:location) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
