# frozen_string_literal: true

FactoryBot.define do
  factory :rent_request do
    status { %w[pending accepted rejected canceled].sample }
  end
end
