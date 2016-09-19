class Pet < ApplicationRecord
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default_pet.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  validates :name, presence: true
  validates :breed, presence: true
  validates :image, presence: true
end
