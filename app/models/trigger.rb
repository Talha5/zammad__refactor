class Trigger < ApplicationModel
  include ChecksConditionValidation
  include ChecksHtmlSanitized
  include CanSeed

  include Trigger::Assets

  store     :condition
  store     :perform
  validates :name,    presence: true
  validates :perform, 'validations/verify_perform_rules': true

  sanitized_html :note
end
