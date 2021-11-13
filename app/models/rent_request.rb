# frozen_string_literal: true

class RentRequest < ApplicationRecord
  belongs_to :rent_item
  belongs_to :user
end
