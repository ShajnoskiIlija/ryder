# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentItemPolicy do
  subject { described_class.new(user, rent_item) }

  let(:rent_item) { create(:rent_item) }

  context 'when user can access or edit items' do
    let(:user) { create(:user) }

    it { is_expected.to forbid_actions(%i[create update]) }
  end
end
