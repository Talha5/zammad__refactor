class RoleGroup < ApplicationModel
  include HasGroupRelationDefinition

  self.table_name = 'roles_groups'

  # don't list roles in Group association result
  Group.association_attributes_ignored :roles
end
