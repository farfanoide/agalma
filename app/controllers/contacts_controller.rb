class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
#    @contact.request = request
#    if @contact.deliver
    if ContactMailer.contact_mail(@contact).deliver
      flash.now[:error]  = nil
      flash.now[:notice] = 'Gracias por contactarse! Le contestaremos a la brevedad.'
    else
      flash.now[:error]= 'Su mensaje no pudo ser enviado.'
    end
    render :new
  end
end
