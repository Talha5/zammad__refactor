class Sequencer
  class Unit
    module Import
      module Ldap
        module Sources
          class SubSequence < Sequencer::Unit::Base
            include ::Sequencer::Unit::Import::Common::SubSequence::Mixin::ImportJob

            uses :dry_run, :configs
            provides :found_ids

            def process
              found_ids = []
              configs.each do |config|
                result = sequence_resource(config)
                found_ids |= Array(result[:found_ids])
              end
              state.provide(:found_ids, found_ids)
            end

            def default_params
              super.merge(
                dry_run: dry_run,
              )
            end

            private

            def sequence
              'Import::Ldap::Users'
            end
          end
        end
      end
    end
  end
end
