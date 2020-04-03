require 'rails_helper'

RSpec.describe "As a User" do
  it "I can see all mechanics" do
    mechanic1 = Mechanic.create(
      name: "Bob",
      experience: 10)
    mechanic2 = Mechanic.create(
      name: "Sherry",
      experience: 18)

    visit '/mechanics'

    within(header) do
      expect(page).to have_content("All Mechanics")
    end
    expect(page).to have_content("#{mechanic1.name} - #{mechanic1.experience} years of experience")
    expect(page).to have_content("#{mechanic2.name} - #{mechanic2.experience} years of experience")
  end
end