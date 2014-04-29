class UsersCell < BaseCell

  def professionals(args)
    set_branch(args)
    if @page_branch
      @professionals ||= Branch.find(@page_branch).users
    else
      array =[]
      Branch.all.each do |b|
        b.users.each do |u|
          array << u
        end
      end
      @professionals =array.uniq {|h| h[:email] }
    end

    render
  end
end
