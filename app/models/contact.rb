class Contact < MailForm::Base
  attribute :name,    validate:  true
  attribute :email,   validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

  validates_presence_of :message
end
