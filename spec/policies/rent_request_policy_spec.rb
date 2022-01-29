# frozen_string_literal: true

require 'rails_helper'

describe RentRequestPolicy do
  subject { described_class.new(user, rent_request) }

  let(:user) { create(:user) }
  let(:rent_request) { create(:rent_request, user: user) }


  permissions  :create?, :index?, :update? do
    it 'allow access to view all items' do
      expect(described_class).to permit(user, rent_request)
    end
  end

#   permissions :index?, :update? do
#     it 'grant index action' do
#       expect(described_class).to permit(rent_request, RentRequest.all)
#     end
#   end


# describe 'when not authorized' do
#     let(:another_user) { create(:user) }
#     let(:another_rent_request) { create(:rent_request, user: another_user) }

#     permissions  :create?, :index?, :update? do
#         it 'allow access to view all items' do
#           expect(described_class).to permit(user, another_rent_request)
#         end
#       end
# end
end
