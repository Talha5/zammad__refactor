module Gql::Types
  class FormIdType < GraphQL::Types::BigInt
    # The project currenly requires FormIDs to be BigInts. Maybe this could be changed to UUIDs later on.
    description 'BigInt to identify a form.'
  end
end
