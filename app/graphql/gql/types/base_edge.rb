module Gql::Types
  class BaseEdge < Gql::Types::BaseObject
    # add `node` and `cursor` fields, as well as `node_type(...)` override
    include GraphQL::Types::Relay::EdgeBehaviors
  end
end
