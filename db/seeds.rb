# frozen_string_literal: true

20.times do
    contact = Contact.create!(
      username: Faker::Internet.username,
      full_name: Faker::Name.first_name,
      email: Faker::Internet.email,
      message: Faker::Lorem.paragraphs
    )
end