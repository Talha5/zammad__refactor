class Sequencer
  class Unit
    module Ldap
      class Config < Sequencer::Unit::Common::Provider::Fallback

        uses :resource
        provides :ldap_config

        private

        def ldap_config
          resource
        end
      end
    end
  end
end
