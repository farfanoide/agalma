class UserPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
  def admin?
   x=false
   record.roles.each do |rol|
   	if rol.name == 'admin'
          x= true
   	end
  end
  return x
 end
end
