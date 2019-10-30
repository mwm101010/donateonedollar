class Donate < ApplicationRecord

  validates :campaign_title, presence: true
  validates :donation_amount, presence: true
  validates :full_name, presence: true
 
end
