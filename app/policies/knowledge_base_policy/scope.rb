class KnowledgeBasePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.permissions?('knowledge_base.editor')
        scope
      else
        scope.active
      end
    end

    private

    def user_required?
      false
    end
  end
end
