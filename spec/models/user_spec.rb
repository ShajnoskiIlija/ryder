# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join('config/initializers/geocoder.rb')

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

  describe 'geocoder test' do
    it 'equal coordinates from geocoder stub' do
      expect(user.latitude).to eq(40.6905444)
      expect(user.longitude).to eq(-73.97793280375983)
    end

    it "doesn't equal coordinates from geocoder stub" do
      expect(user.latitude).not_to eq(40.6666)
      expect(user.longitude).not_to eq(-73.97793280375334)
    end
  end
end
