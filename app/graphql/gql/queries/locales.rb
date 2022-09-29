module Gql::Queries
  class Locales < BaseQuery

    description 'Locales available in the system'

    type [Gql::Types::LocaleType, { null: false }], null: false

    def resolve(...)
      Locale.all
    end

  end
end
