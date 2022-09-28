class Template < ApplicationModel
  include ChecksClientNotification
  include Template::Assets

  store     :options
  validates :name, presence: true

  association_attributes_ignored :user
end
