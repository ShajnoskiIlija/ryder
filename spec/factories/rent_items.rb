# frozen_string_literal: true

FactoryBot.define do
  factory :rent_item do
    association :user, factory: :user
    location { Faker::Address.street_name }
    condition { CONDITIONS.sample }
    for_age { FOR_AGES.sample }
    item_type { ITEM_TYPES.sample }
    available { Faker::Boolean.boolean }
  end
end
