class Contact < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  def send_message_email
      NotificationMailer.message_added(self).deliver_now
  end

end
