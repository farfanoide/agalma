class BranchCell < Cell::Rails

  def internal_branches
    @internal_branches ||= Branch.internal
    render
  end

  def external_branches
    @external_branches ||= Branch.external
    render
  end
end
