class NotificationMailer < ApplicationMailer
  default from: "no-reply@donateonedollar.com"

  def message_added
    mail(to: "mamw.muthu@gmail.com",
         subject: "A new message has been added to database")
  end
end
