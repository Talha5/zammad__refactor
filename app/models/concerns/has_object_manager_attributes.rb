module HasObjectManagerAttributes
  extend ActiveSupport::Concern

  included do
    # Disable table inheritance to allow columns with the name 'type'.
    self.inheritance_column = nil

    validates_with ObjectManager::Attribute::Validation, on: %i[create update]

    after_initialize ObjectManager::Attribute::SetDefaults.new
  end
end
