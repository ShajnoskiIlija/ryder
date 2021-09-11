# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'contact model spec' do
    it 'does not let a user to leave empty field' do
      contact = described_class.create!(full_name: 'test', email: 'goo@google.com', message: 'poraka')
      expect(contact).to validate_presence_of(:full_name)
      expect(contact).to validate_presence_of(:message)
      expect(contact).to validate_presence_of(:email)
    end
  end
end
