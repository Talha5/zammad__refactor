class UserGroup < ApplicationModel
  include HasGroupRelationDefinition

  self.table_name = 'groups_users'
end
