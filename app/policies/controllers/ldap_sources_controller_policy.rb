class Controllers::LdapSourcesControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.integration.ldap')
end
