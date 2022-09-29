module CurrentAttributesHelper
  # clear ActiveSupport::CurrentAttributes caches

  def self.included(base)
    base.teardown do
      ActiveSupport::CurrentAttributes.clear_all
    end
  end
end
