class PagePolicy < Struct.new(:user, :page)
   
    def new?
      admin?
    end

    def create?
      admin?
    end  
    
    def edit?
      admin?
    end
    
    def update?
      admin?
    end

    def destroy?
      admin?
    end 

    def admin?
      user.admin?
    end  
  end
