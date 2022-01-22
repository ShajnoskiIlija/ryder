# frozen_string_literal: true

require 'rails_helper'

describe RentItemPolicy do
  subject { described_class.new(user, rent_item) }

  let(:rent_item) { create(:rent_item) }

  permissions :update?, :edit?, :destroy? do
    it 'allowes access' do
      expect(described_class).to permit(User.new, RentItem.new)
    end
  end

  permissions :index?, :new?, :create? do
    it 'allowes access to view all items' do
      expect(described_class).to permit(rent_item, RentItem.all)
    end
  end

  context 'when creating and displayiyng an item' do
    let(:user) { create(:user) }

    it { is_expected.to permit_actions(%i[new create index]) }
  end
end
