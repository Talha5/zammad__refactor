class Sequencer
  class Unit
    module Import
      module Kayako
        module Post
          module Channel
            class Messenger < Sequencer::Unit::Import::Kayako::Post::Channel::Mail
              private

              def article_type_name
                'chat'
              end
            end
          end
        end
      end
    end
  end
end
