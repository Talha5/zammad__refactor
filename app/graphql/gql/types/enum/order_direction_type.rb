module Gql::Types::Enum
  class OrderDirectionType < BaseEnum
    description 'Option to choose SQL sorting direction'

    value 'ASCENDING',  'Sort with ascending order', value: 'ASC'
    value 'DESCENDING', 'Sort with descending order', value: 'DESC'
  end
end
