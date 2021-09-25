# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
