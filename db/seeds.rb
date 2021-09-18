# frozen_string_literal: true

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

5.times do
    create(:contact)
end