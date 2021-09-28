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
    user = create(:user)

    rand(2..5).times { create(:rent_item, user: user) }
end

# puts 'Creating items...'
# 5.times do
#     create(:rent_item)
# end

puts 'Seeding completed!'
