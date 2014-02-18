class UsersController < ApplicationController

    before_action :set_user

    private

        # Use callbacks to share common setup or constraints between actions.
        def set_user
            @user = User.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            rolif_attrs = [:id, :role_id, :user_id, :branch_id, :_destroy]
            params.require(:user).permit(:name, :email, rolifications_attributes: rolif_attrs)
        end
end
