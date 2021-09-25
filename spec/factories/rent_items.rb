# frozen_string_literal: true

FactoryBot.define do
  factory :rent_item do
    location { Faker::Address.street_name }
    condition { %w[used new].sample }
    for_age { %w[children female all proffesionals].sample }
    item_type { ['bike', 'electric scooter', 'winter equipment', 'summer equipment'].sample }
  end
end
