class Contact < MailForm::Base
  attribute :name,    validate:  true
  attribute :email,   validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :recipients

  validates_presence_of :message,:to,:email
end
