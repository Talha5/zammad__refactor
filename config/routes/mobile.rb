# Temporary Hack: only process trigger events if ActionCable is enabled.
# TODO: Remove when this switch is not needed any more.

if ENV['ENABLE_EXPERIMENTAL_MOBILE_FRONTEND'] == 'true'
  Zammad::Application.routes.draw do
    get '/mobile', to: 'mobile#index'
    get '/mobile/*path', to: 'mobile#index'
  end
end
