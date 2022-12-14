class Sequencer
  class Unit
    module Import
      module Common
        module Model
          module Statistics
            module Diff
              class ModelKey < Sequencer::Unit::Base
                include ::Sequencer::Unit::Import::Common::Model::Statistics::Mixin::ActionDiff

                uses :model_class

                def process
                  state.provide(:statistics_diff) do
                    {
                      model_key => diff,
                    }
                  end
                end

                private

                def model_key
                  model_class.name.pluralize.to_sym
                end
              end
            end
          end
        end
      end
    end
  end
end
