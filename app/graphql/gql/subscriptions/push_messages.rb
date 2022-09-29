module Gql::Subscriptions
  class PushMessages < BaseSubscription

    description 'Broadcast messages to all users'

    field :title, String, null: true, description: 'Message title'
    field :text, String, null: true, description: 'Message text'

    def update
      object
    end

    def self.register_in_schema(schema)
      schema.field field_name, resolver: self, broadcastable: true
    end
  end
end
