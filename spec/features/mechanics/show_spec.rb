require 'rails_helper'

RSpec.describe "As a user" do
  it "I can see a mechanic's show page" do
    mechanic = Mechanic.create(
      name:       'Kara Smith',
      experience: 11)
    park = Park.create(
      name:   'Hershey Park',
      price:  '$50.00')
    the_frog_hopper = park.rides.create(
      name: 'The Frog Hopper',
      rating: 8)
    fahrenheit = park.rides.create(
      name: 'Fahrenheit',
      rating: 7.9)
    the_kiss_raise = park.rides.create(
      name: 'The Kiss Raise',
      rating: 7.5)

    visit "/mechanics/#{mechanic.id}"

    within('#mechanic-info') do
      expect(page).to have_content("Mechanic: #{mechanic.name}")
      expect(page).to have_content("Years of Experience: #{mechanic.experience}")
    end
    within('#rides') do
      expect(page).to have_content("Current rides they're working on:")
      expect(page).to have_content(the_frog_hopper.name)
      expect(page).to have_content(fahrenheit.name)
    end

    within('#add-rides') do
      expect(page).to have_content('Add a ride to workload:')
      fill_in :id, with: the_kiss_raise.id
      click_on 'Submit'
    end

    expect(page).to have_current_path("/mechanics/#{mechanic.id}")
    
    within('#rides') do
      expect(page).to have_content(the_frog_hopper.name)
      expect(page).to have_content(fahrenheit.name)
      expect(page).to have_content(the_kiss_raise.name)
    end
  end
end