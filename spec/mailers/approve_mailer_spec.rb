# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApproveMailer, type: :mailer do
  describe 'approve mail' do
    let(:user) { create(:user) }
    let(:rent_request) { create(:rent_request, user: user, status: 'accepted') }
    let(:mail) { described_class.new_approve(rent_request) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Your request is approved')
      expect(mail.to).to eq([rent_request.user.email])
      expect(mail.from).to eq(['rydewithus22@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include(' We want to inform you that your request is approved')
    end
  end
end
