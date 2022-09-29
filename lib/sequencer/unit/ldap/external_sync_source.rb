class Sequencer
  class Unit
    module Ldap
      class ExternalSyncSource < Sequencer::Unit::Common::Provider::Named

        def external_sync_source
          'Ldap::User'
        end
      end
    end
  end
end
