# Rails' constant auto-loading resolves to 'rails/initializable' instead
require 'zammad/application/initializer/db_preflight_check'

Zammad::Application::Initializer::DbPreflightCheck.perform
