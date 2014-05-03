class UsersCell < BaseCell

  def professionals(args)
    set_branch(args)
    if @page_branch
      @professionals ||= Branch.find(@page_branch).users
    else
      @professionals = []
      Branch.all.each {|branch| @professionals += branch.users}
      @professionals.uniq!
    end
    render
  end

end
