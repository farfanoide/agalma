class Backend::MailerController < BackendController
  def index
    @users = User.all
  end

  def new
  end

end
