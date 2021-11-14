class FerretPolicy  < ApplicationPolicy
    def create?
        user.admin? || user.id == record.ferret.user.id
    end
    def edit?
        create?
    end
    def update?
    create?
    end
end