class BackendController < ActionController::Base

    include Pundit

    before_filter :authorize_user
    layout "backend"

    private
        def authorize_user
            flash.now[:error] = 'Gracias por contactarse! Le contestaremos a la brevedad.'
            authenticate_user!
            redirect_to :root unless current_user.admin?
        end
end