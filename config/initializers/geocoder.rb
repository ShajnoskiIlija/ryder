if Rails.env.test?
  Geocoder.configure(lookup: :test)
  # Particular Look up
  Geocoder::Lookup::Test.add_stub(
    "New York, NY", [
      {
        'latitude'     => 40.6905444,
        'longitude'    => -73.97793280375983,
        'address'      => 'New York, NY, USA',
      }
    ]
  )
  #default stub
  Geocoder::Lookup::Test.set_default_stub(
    [
      {
        'latitude'     => 40.6905444,
        'longitude'    => -73.97793280375983,
        'address'      => 'New York, NY, USA',
      }
    ]
  )
else
end