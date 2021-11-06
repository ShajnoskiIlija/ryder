# frozen_string_literal: true

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

puts 'Seed started...'

puts 'Creating contacts...'
5.times do
    create(:contact)
end

puts 'Creating users...'

5.times do |index|

    user = index.zero? ? create(:user, email: 'user@test.com', first_name: 'Ilija', last_name: 'Shajnoski', address: 'radozda struga') : create(:user)

    rand(7..16).times { create(:rent_item, user: user) }
end

puts 'Seeding completed!'
