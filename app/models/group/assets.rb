class Group
  module Assets
    extend ActiveSupport::Concern

    def filter_unauthorized_attributes(attributes)
      return super if UserInfo.assets.blank? || UserInfo.assets.agent?

      attributes = super
      attributes.slice('id', 'name', 'active')
    end
  end
end
