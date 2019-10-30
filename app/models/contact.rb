class Contact < ApplicationRecord
 
 validates :name, presence: true
 validates :email, presence: true
 validates :phone_number, presence: true
 validates :message, presence: true

 
  def send_message_email
      NotificationMailer.message_added(self).deliver_now
  end

end
