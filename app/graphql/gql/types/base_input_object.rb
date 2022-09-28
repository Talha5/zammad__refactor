module Gql::Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Gql::Types::BaseArgument
  end
end
