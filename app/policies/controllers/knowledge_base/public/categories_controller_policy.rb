class Controllers::KnowledgeBase::Public::CategoriesControllerPolicy < ApplicationPolicy
  def index?
    return true if user&.permissions?('knowledge_base.editor')
    return true if record.present?

    false
  end
end
