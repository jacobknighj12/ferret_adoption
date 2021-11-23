class FerretPolicy < ApplicationPolicy
    def create?
        user.role == "admin" || user.id == record.user_id
    end
    def edit?
        user.role == "admin" || user.id == record.user_id
    end
    def update?
        user.role == "admin" || user.id == record.user_id
    end
    def destroy?
        p user
        p @current_user
        p user.role
        user.role == "admin" || user.id == record.user_id
    end
end