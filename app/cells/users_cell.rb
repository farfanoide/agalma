class UsersCell < BaseCell

  def professionals(args)
    set_branch(args)
    if @page_branch
      @professionals ||= Branch.find(@page_branch).users
    end

  end
end
