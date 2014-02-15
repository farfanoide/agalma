class ContactMailer < ActionMailer::Base
  default from: "agalma.com"

  def contact_mail(contact)
    @contact = contact
    mail(to: "ilstucardo@gmail.com", subject: "Has recibido un nuevo mensaje!")
  end

end
