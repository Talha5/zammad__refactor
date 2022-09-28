module Import
  class Ldap < Import::IntegrationBase
    include Import::Mixin::Sequence

    def self.queueable?
      active? && LdapSource.count.positive?
    end

    private

    def sequence_name
      'Import::Ldap::Sources'
    end
  end
end
