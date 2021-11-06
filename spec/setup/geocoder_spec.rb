# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Geocoder do
  before do
    described_class.configure(lookup: :test)

    Geocoder::Lookup::Test.add_stub(
      'New York, NY', [
        {
          'latitude' => 40.7143528,
          'longitude' => -74.0059731,
          'address' => 'New York, NY, USA',
          'state' => 'New York',
          'state_code' => 'NY',
          'country' => 'United States',
          'country_code' => 'US'
        }
      ]
    )
  end
end
