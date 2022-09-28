RSpec.configure do |config|
  # clear ActiveSupport::CurrentAttributes caches
  config.after do
    ActiveSupport::CurrentAttributes.clear_all
  end
end
