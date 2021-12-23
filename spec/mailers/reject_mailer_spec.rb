# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RejectMailer, type: :mailer do
  describe 'send_reject mail' do
    let(:user) { create(:user) }
    let(:rent_request) { create(:rent_request, user: user, status: 'rejected') }
    let(:mail) { described_class.reject_email(rent_request) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Unfortunately your request was not accepted by the owner')
      expect(mail.to).to eq([rent_request.user.email])
      expect(mail.from).to eq(['rydewithus22@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include(' We want to inform you that your request is not approved')
    end
  end
end
