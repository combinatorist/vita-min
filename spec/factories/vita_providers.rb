# == Schema Information
#
# Table name: vita_providers
#
#  id               :bigint           not null, primary key
#  appointment_info :string
#  archived         :boolean          default(FALSE), not null
#  coordinates      :geography        point, 4326
#  dates            :string
#  details          :string
#  hours            :string
#  languages        :string
#  name             :string
#  created_at       :datetime
#  updated_at       :datetime
#  irs_id           :string           not null
#  last_scrape_id   :bigint
#
# Indexes
#
#  index_vita_providers_on_irs_id          (irs_id) UNIQUE
#  index_vita_providers_on_last_scrape_id  (last_scrape_id)
#
# Foreign Keys
#
#  fk_rails_...  (last_scrape_id => provider_scrapes.id)
#

FactoryBot.define do
  factory :vita_provider do
    name { "Public Library of the Test Suite" }
    sequence(:irs_id) { |n| "1234#{n}" }
  end

  trait :with_coordinates do
    transient do
      lat_lon { [37.840284, -122.274668] }
    end

    before(:create) do |provider, evaluator|
      provider.set_coordinates(lat: evaluator.lat_lon[0], lon: evaluator.lat_lon[1])
    end
  end
end
