class Backend::MailerController < BackendController
  def index
    @users = User.all
  end

  def send

  end

end
