class BackendController < ActionController::Base
    before_filter :authenticate_user!
    layout "backend"
end