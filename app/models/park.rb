class Park < ApplicationRecord
  has_many :rides

  def average_ride_rating
    rides.average(:rating)
  end
end