class BackendController < ActionController::Base
    add_flash_types :error
    include Pundit

    before_filter :authorize_user
    layout 'backend'

    private

      def authorize_user
        authenticate_user!
        # TODO: refactor this to pundit!
        redirect_to :root if !current_user.admin?
        if current_user.branches.any?
          session[:current_branch] ||= current_user.branches.first.id
        end
      end
end