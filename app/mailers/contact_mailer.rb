class ContactMailer < ActionMailer::Base
  default from: "agalma.com"

  
  def contact_mail(contact)
    @contact = contact
#    ContactMailer.default_url_options[:host] = request.host_with_port
    mail(to: "stkboy@gmail.com", subject: "Has recibido un nuevo mensaje!")
  end

end
