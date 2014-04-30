class BranchCell < BaseCell

  append_view_path "app/views/"

  def internal_branches(args)
    @internal_branches ||= Branch.all
    render
  end

  def external_branches
    @external_branches ||= ExternalBranch.all
    render
  end
end
