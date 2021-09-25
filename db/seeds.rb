# frozen_string_literal: true

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

puts 'Seed started...'

puts 'Creating contacts...'
5.times do
    create(:contact)
end

puts 'Creating users...'
create(:user, email: 'user@test.com', first_name: 'Ilija', last_name: 'Shajnoski')

10.times do
     create(:user)
end

puts 'Seeding completed!'
