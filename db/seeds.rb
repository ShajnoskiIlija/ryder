# frozen_string_literal: true

5.times do
    contact = Contact.create!(
      full_name: Faker::Name.first_name,
      email: Faker::Internet.email,
      message: Faker::Lorem.paragraphs
    )
end