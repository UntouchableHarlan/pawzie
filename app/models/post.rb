class Post < ApplicationRecord
  acts_as_votable
  
  belongs_to :user
  belongs_to :pet
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default_pet.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, presence: true

end
