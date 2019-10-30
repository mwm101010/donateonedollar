class Campaign < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :description_short, presence: true
  validates :description_full, presence: true
  validates :goal, presence: true
  validates :raised, presence: true

  mount_uploader :picture, PictureUploader
  
end
