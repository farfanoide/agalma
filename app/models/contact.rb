class Contact
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :message
  

  validates_presence_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :multiline => true
# checkear validacion
  validates_length_of :message, :within => 1..500


end
  
