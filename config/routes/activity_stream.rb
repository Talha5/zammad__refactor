Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/activity_stream',   to: 'as#show', via: :get

end
