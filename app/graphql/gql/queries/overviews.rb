module Gql::Queries
  class Overviews < BaseQuery

    description 'Ticket overviews available in the system'

    def self.authorize(_obj, ctx)
      ctx.current_user
    end

    type Gql::Types::OverviewType.connection_type, null: false

    def resolve(...)
      Ticket::Overviews.all(current_user: context.current_user)
    end

  end
end
