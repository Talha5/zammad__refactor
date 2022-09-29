module Gql::Types::Ticket
  class StateTypeType < Gql::Types::BaseObject
    include Gql::Concern::IsModelObject

    description 'Ticket state types'

    field :name, String, null: false
    field :note, String, null: true
  end
end
