module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_galery(name, f, association)

    if f.object.new_record?
      new_object = f.object.build_galery
    else
      new_object = f.object.galery
    end
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s + "_fields", f: builder)
    end
    if f.object.new_record?
      link_to(name, '#', class: "add_galery", data: {id: id, fields: fields.gsub("\n", "")})
    end
  end

  def authorize_content
    if current_user
      current_user.admin?
    end
  end

  def backend_edit_link(object)
    link_to 'editar',
      edit_polymorphic_path([:backend, object]),
      class: :'button'
  end

  def backend_destroy_link(object)
    link_to 'Borrar',
      polymorphic_path([:backend, object]),
      method: :delete,
      data: { confirm: 'Esta seguro?' },
      class: :button
  end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end

