class Sequencer
  class Unit
    module Freshdesk
      class Connected < Sequencer::Unit::Common::Provider::Named
        extend ::Sequencer::Unit::Import::Freshdesk::Requester

        private

        def connected
          response = self.class.perform_request(
            api_path: 'agents/me',
          )

          response.is_a?(Net::HTTPOK)
        rescue => e
          logger.error e
          nil
        end
      end
    end
  end
end
