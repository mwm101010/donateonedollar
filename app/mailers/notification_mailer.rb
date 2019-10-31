class NotificationMailer < ApplicationMailer
  default from: "no-reply@donateonedollar.com"

  def message_added(contact)
    @message = contact.message
    @name = contact.name
    mail(to: "mamw.muthu@gmail.com",
         subject: "A new message has been added to the database by #{@name}")
  end
end
