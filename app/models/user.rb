class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :password, presence: true, length: { in: 6..20 }

  has_secure_password
  has_many :pets

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    address + " " + city + " " + state + " " + zip
  end

  def default_picture

  end

  def execpt_current_user(user)
    user.reject { |u| u.id == self.id }
  end
end
