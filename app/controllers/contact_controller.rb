class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if contact.valid?
      # send mail to admin
      redirect_to root_url, notice: "Gracias guachen. Se envio el msg"
    else
      render "new"
  end
end
