class GalleryCell < BaseCell
  include Devise::Controllers::Helpers

  append_view_path "app/views/"

  def branch_galleries(args)
    set_branch(args)
    if @page_branch
      @galleries ||= @page_branch.galeries
      render
    end
  end

  def all_galleries(args)
    if signed_in?
      @galleries ||= Galery.all
    else
      @galleries ||= Galery.public
    end
    render
  end

end
