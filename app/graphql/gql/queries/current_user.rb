module Gql::Queries
  class CurrentUser < BaseQuery

    description 'Information about the authenticated user'

    type Gql::Types::UserType, null: false

    def self.authorize(_obj, ctx)
      ctx.current_user
    end

    def resolve(...)
      context.current_user
    end

  end
end
