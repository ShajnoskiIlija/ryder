# frozen_string_literal: true

class RentRequest < ApplicationRecord
  belongs_to :rent_item
  belongs_to :user

  STATUSES = %w[pending accepted rejected canceled].freeze
  UPDATE_STATUSES = %w[accepted rejected].freeze

  validates :status, inclusion: { in: UPDATE_STATUSES }, on: :update

  def accepted?
    status == 'accepted'
  end

  def rejected?
    status == 'rejected'
  end

  def reject!
    update(status: 'rejected')
  end

  scope :pending, -> { where(status: 'pending') }
  scope :accepted, -> { where(status: 'accepted') }
  scope :rejected, -> { where(status: 'rejected') }
end
