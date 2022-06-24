class Book < ApplicationRecord

belongs_to :user
  
  has_one_attached :profile_image
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
  validates :title, presence: true
  validates :body, presence: true

end