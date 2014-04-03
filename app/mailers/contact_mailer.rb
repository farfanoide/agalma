class ContactMailer < ActionMailer::Base
  default from: "agalma.com"

  def contact_mail(contact)
    @contact = contact
    mail(to: "fernan.nestier@gmail.com", subject: "Has recibido un nuevo mensaje!")
  end

  def contacts_mails(contact, user)
    @user = user
    @contact = contact
    @contact.recipients.each do |r|
      mail(to: r.to_s, subject: "Has recibido un nuevo mensaje!").deliver
    end
  end
end
