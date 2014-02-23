class Backend::ContactsController < ApplicationController

    before_action :set_contact, only: [:create]

    def new
        @contact = Contact.new
	@users=User.all
    end

    def create

      if ContactMailer.contacts_mails(@contact)
            flash.now[:error]  = nil
            flash.now[:notice] = 'Gracias por contactarse! Le contestaremos a la brevedad.'
            redirect_to :root
        else
            flash.now[:error]= 'Su mensaje no pudo ser enviado.'
            render :new
        end
    end

    private

        def contact_params
            params.require(:contact).permit(:name, :email, :message,to:[])
        end

        def set_contact
            @contact = Contact.new(contact_params)
        end
end
