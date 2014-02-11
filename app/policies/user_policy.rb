class UserPolicy < Struct.new(:user, :scope)
    def admin?
    user.roles.each do |rol|
     if rol.name=="admin"
        break
    end
    end
    end
end
