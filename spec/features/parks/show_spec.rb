require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see a park's show page" do
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

    average_rating = (lightning_racer.rating + storm_runner.rating + the_great_bear.rating).fdiv(park.rides.size)

    visit "/parks/#{park.id}"

    expect(page).to have_content(park.name)
    expect(page).to have_content(park.price)
    within('#rides') do
      expect(page).to have_content(lightning_racer.name)
      expect(page).to have_content(storm_runner.name)
      expect(page).to have_content(the_great_bear.name)
    end
    within('#statistics') do
      expect(page).to have_content("Average Thrill Rating of Rides: ")
    end
  end
end