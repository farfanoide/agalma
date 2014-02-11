class BranchPolicy < Struct.new(:user, :branch)
    def edit?
      admin?
    end

    def admin?
     user.can_edit_branch? branch
    end 

end
