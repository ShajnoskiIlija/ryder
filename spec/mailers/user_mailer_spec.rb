# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'user_mailer' do
    let!(:user) { create(:user, email: 'user@test.com') }
    let(:mail) { described_class.with(user: user).welcome_email.deliver_now }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to Ryder')
      expect(mail.to).to eq(['user@test.com'])
      expect(mail.from).to eq(['rydewithus22@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include('You have successfully signed up to ryder.com')
    end
  end
end
