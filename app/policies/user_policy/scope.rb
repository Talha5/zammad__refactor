class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope

    def resolve
      if user.permissions?(['ticket.agent', 'admin.user'])
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
