# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentItem, type: :model do
  let(:rent_type) { create(:rent_item) }

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

  describe 'should include scope' do
    let(:rent_type) { create(:rent_item, item_type: 'bicycle') }

    it 'exist' do
      expect((described_class.rent_item_per_type('bicycle'))).to exist(item_type: rent_type.item_type)
    end

    it 'not exist' do
      expect((described_class.rent_item_per_type('summer equipment'))).not_to exist(item_type: rent_type.item_type)
    end
  end
end
