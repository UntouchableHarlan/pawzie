class User < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_secure_password
  has_many :pets

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    address + " " + city + " " + state + " " + zip
  end
end
