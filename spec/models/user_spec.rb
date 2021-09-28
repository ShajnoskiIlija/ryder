# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'validations' do
    it { expect(user).to be_valid }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
    it { expect(user).to validate_presence_of(:address) }
    it { expect(user).to validate_presence_of(:phone_number) }
  end

  describe 'post associations' do
    it { is_expected.to have_many(:rent_items) }
  end
end
