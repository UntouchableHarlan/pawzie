class User < ApplicationRecord
  has_secure_password
  has_many :pets

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    address + " " + city + " " + state + " " + zip
  end
end
