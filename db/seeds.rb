# frozen_string_literal: true

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

puts 'Seed started...'

if Rails.env.development?
    puts 'Creating contacts...'
    5.times do
        create(:contact)
    end

    puts 'Creating users...'

    5.times do |index|

        user = index.zero? ? create(:user, email: 'user@test.com', first_name: 'John', last_name: 'Smith', address: 'radozda struga') : create(:user)

        rand(7..16).times { create(:rent_item, user: user) }
    end

    puts 'Creating requests'

    3.times do
        rand(1..4).times { create(:rent_request, rent_item: User.first.rent_items.sample,  user: User.where.not(id: User.first.id).sample) }
    end
end

puts 'Seeding completed!'
