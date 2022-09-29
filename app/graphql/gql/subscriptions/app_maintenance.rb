module Gql::Subscriptions
  class AppMaintenance < BaseSubscription

    description 'Application update/change events'

    field :type, Gql::Types::Enum::AppMaintenanceTypeType, null: true, description: 'Maintenance type, may trigger actions in the front end'

    def update
      object
    end

    def self.register_in_schema(schema)
      schema.field field_name, resolver: self, broadcastable: true
    end
  end
end
