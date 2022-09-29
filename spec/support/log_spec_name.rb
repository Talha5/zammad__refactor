RSpec.configure do |config|

  config.prepend_before do |example|
    Rails.logger.info "=== running RSpec example '#{example.metadata[:full_description]}'"
  end
end
