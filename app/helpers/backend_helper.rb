module BackendHelper
  def show_link(object)
    link_to fa_icon(:eye),
      polymorphic_path(object),
      class: :'btn btn-primary btn-sm',
      data: {toggle: 'tooltip', 'original-title' => 'Ver'}
  end
  def edit_link(object)
    link_to fa_icon(:edit),
      edit_polymorphic_path([:backend, object]),
      class: :'btn btn-success btn-sm',
      data: {toggle: 'tooltip', 'original-title' => 'Editar'}
  end
  def destroy_link(object)
    link_to fa_icon('trash-o'),
      polymorphic_path([:backend, object]),
      method: :delete,
      data: {confirm: 'Esta seguro?', toggle: 'tooltip', 'original-title' => 'Borrar'},
      class: :'btn btn-danger btn-sm'
  end
end
