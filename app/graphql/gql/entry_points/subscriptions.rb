module Gql::EntryPoints
  class Subscriptions < Gql::Types::BaseObject
    # # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    description 'All available subscriptions'

    Mixin::RequiredSubPaths.eager_load_recursive Gql::Subscriptions, "#{__dir__}/../subscriptions/"
    Gql::Subscriptions::BaseSubscription.descendants.reject { |klass| klass.name.include?('::Base') }.each do |klass|
      klass.register_in_schema(self)
    end
  end
end
