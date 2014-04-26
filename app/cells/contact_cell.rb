class ContactCell < BaseCell

  append_view_path "app/views/"

  def contact_form(args)
    @contact = Contact.new
    render
  end

end
