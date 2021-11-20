# frozen_string_literal: true

FactoryBot.define do
  factory :rent_request do
    association :user, factory: :user
    association :rent_item, factory: :rent_item
  end
end
