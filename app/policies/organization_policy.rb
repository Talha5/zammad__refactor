class OrganizationPolicy < ApplicationPolicy

  def show?
    return true if user.permissions?(['admin', 'ticket.agent'])
    return true if user.organization_id?(record.id)

    false
  end

  def update?
    return true if user.permissions?(['admin', 'ticket.agent'])

    false
  end
end
