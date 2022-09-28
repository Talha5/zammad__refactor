module Gql::Types::Enum
  class TextDirectionType < BaseEnum
    description 'Option to choose SQL sorting direction'

    value 'ltr', 'Left-to-right'
    value 'rtl', 'Right-to-left'
  end
end
