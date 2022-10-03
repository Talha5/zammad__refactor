Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/data_privacy_tasks',               to: 'dpt#index',   via: :get
  match api_path + '/data_privacy_tasks/:id',           to: 'dpt#show',    via: :get
  match api_path + '/data_privacy_tasks',               to: 'dpt#create',  via: :post
  match api_path + '/data_privacy_tasks/:id',           to: 'dpt#update',  via: :put
  match api_path + '/data_privacy_tasks/:id',           to: 'dpt#destroy', via: :delete

end
