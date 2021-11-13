# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, :address, :phone_number, presence: true
  validates :email, uniqueness: true

  has_many :rent_items, dependent: :destroy
  has_many :rent_requests, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed

  def address_changed
    address.present? && address_changed?
  end
end
