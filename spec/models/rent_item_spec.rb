# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentItem, type: :model do
  describe 'factories' do
    it do
      expect(build(:rent_item)).to be_valid
    end
  end
end
