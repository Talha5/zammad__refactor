Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  # CRUD
  match api_path + '/external_credentials',                    to: 'ec#index',   via: :get
  match api_path + '/external_credentials/:id',                to: 'ec#show',    via: :get
  match api_path + '/external_credentials',                    to: 'ec#create',  via: :post
  match api_path + '/external_credentials/:id',                to: 'ec#update',  via: :put
  match api_path + '/external_credentials/:id',                to: 'ec#destroy', via: :delete

  # callback URL
  match api_path + '/external_credentials/:provider/app_verify',   to: 'ec#app_verify',   via: :post
  match api_path + '/external_credentials/:provider/link_account', to: 'ec#link_account', via: :get
  match api_path + '/external_credentials/:provider/callback',     to: 'ec#callback',     via: :get

end
