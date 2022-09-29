module Gql::Types
  class KeyComplexValueType < Gql::Types::BaseObject

    description 'Key/value type with complex (JSON) values.'

    field :key, String, null: false
    field :value, GraphQL::Types::JSON, null: true
  end
end
