# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :full_name, :email, presence: true
  validates :message, length: { maximum: 600 }, presence: true
end
