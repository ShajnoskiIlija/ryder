# frozen_string_literal: true

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

puts 'Seed started...'

puts 'Creating contacts...'
5.times do
    create(:contact)
end

puts 'Creating users...'

11.times do |index|

    # if index.zero?
    #     create(:user, email: 'user@test.com', first_name: 'Ilija', last_name: 'Shajnoski')
    # else
    #     create(:user)
    # end ## this is simplified below

    user = index.zero? ? create(:user, email: 'user@test.com', first_name: 'Ilija', last_name: 'Shajnoski') : create(:user)

    rand(2..6).times { create(:rent_item, user: user) }
end

puts 'Seeding completed!'
