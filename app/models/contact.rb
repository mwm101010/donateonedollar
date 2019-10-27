class Contact < ApplicationRecord
 
  def send_message_email
      NotificationMailer.message_added(self).deliver_now
  end

end
