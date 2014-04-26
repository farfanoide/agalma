class BaseCell < Cell::Rails
  def set_branch(args)
   @page_branch =  args[:branch]
  end
end
