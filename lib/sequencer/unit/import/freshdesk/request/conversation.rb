class Sequencer
  class Unit
    module Import
      module Freshdesk
        class Request < Sequencer::Unit::Common::Provider::Attribute
          class Conversation < Sequencer::Unit::Import::Freshdesk::Request::Generic
            attr_reader :ticket

            def initialize(...)
              super
              @ticket = request_params.delete(:ticket)
            end

            def api_path
              "tickets/#{ticket['id']}/conversations"
            end
          end
        end
      end
    end
  end
end
