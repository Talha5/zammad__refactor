class Sequencer
  class Unit
    module Import
      module Freshdesk
        module ObjectAttribute
          class Skip < Sequencer::Unit::Base

            uses :resource
            provides :action

            def process
              return if !resource['default'] || allowed_default_attributes.include?(resource['name'])

              state.provide(:action, :skipped)
            end

            private

            def allowed_default_attributes
              @allowed_default_attributes ||= %w[ticket_type]
            end
          end
        end
      end
    end
  end
end
