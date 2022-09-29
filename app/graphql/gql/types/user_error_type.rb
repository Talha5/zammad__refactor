module Gql::Types
  class UserErrorType < Gql::Types::BaseObject

    description 'Represents an error in the input of a mutation.'

    field :message, String, null: false
    field :field, String, null: true
  end
end
