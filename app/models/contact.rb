class Contact < ApplicationRecord
  after_create :send_message_email
 
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :message, presence: true

 
  def send_message_email
      NotificationMailer.message_added.deliver_now
  end

end
