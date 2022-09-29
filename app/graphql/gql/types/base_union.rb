module Gql::Types
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class(Gql::Types::BaseEdge)
    connection_type_class(Gql::Types::BaseConnection)
  end
end
