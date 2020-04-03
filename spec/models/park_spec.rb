require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe '#average_ride_rating' do
    it 'calculates average ride thrill rating' do
      park = Park.create(
        name:   'Hershey Park',
        price:  '$50.00')
      lightning_racer = park.rides.create(
        name: 'Lightning Racer',
        rating: 8)
      storm_runner = park.rides.create(
        name: 'Storm Runner',
        rating: 7.9)
      the_great_bear = park.rides.create(
        name: 'The Great Bear',
        rating: 7.5)

      average_rating = (lightning_racer.rating + storm_runner.rating + the_great_bear.rating)/(park.rides.size)

      expect(park.average_ride_rating).to eq(average_rating)
    end
  end
end