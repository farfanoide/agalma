class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error]  = nil
      flash.now[:notice] = 'Gracias por su contactarse! Lo contestaremos a la brevedad.'
    else
      flash.now[:error]= 'Su mensaje no pudo ser enviado.'
      render :new
    end
  end

end
