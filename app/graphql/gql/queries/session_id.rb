module Gql::Queries
  class SessionId < BaseQuery

    description 'The sessionId of the currently authenticated user.'

    type String, null: false

    def self.authorize(_obj, ctx)
      ctx.current_user
    end

    def resolve(...)
      context[:sid]
    end

  end
end
