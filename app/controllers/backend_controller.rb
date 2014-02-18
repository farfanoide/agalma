class BackendController < ActionController::Base
    before_filter :authorize_user
    
    layout "backend"
    include Pundit

    private 
      def authorize_user
	authenticate_user!
	redirect_to :root unless current_user.admin?
      end
end