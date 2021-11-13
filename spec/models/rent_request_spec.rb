# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentRequest, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:rent_item) }
  end
end
