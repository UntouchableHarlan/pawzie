class User < ApplicationRecord
  has_secure_password
  has_many :pets

  geocoded_by :address
  after_validation :geocode
end
