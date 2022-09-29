RSpec.configure do |config|
  config.before :suite do
    if !Rails.env.development? && !ENV['CI_SKIP_ASSETS_PRECOMPILE']
      puts 'Making sure assets are up-to-date...'
      Rake::Task['assets:precompile'].execute
    end
  end
end
