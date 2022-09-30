Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  # core_workflows
  match api_path + '/core_workflows',            to: 'cw#index',   via: :get
  match api_path + '/core_workflows/:id',        to: 'cw#show',    via: :get
  match api_path + '/core_workflows',            to: 'cw#create',  via: :post
  match api_path + '/core_workflows/:id',        to: 'cw#update',  via: :put
  match api_path + '/core_workflows/:id',        to: 'cw#destroy', via: :delete
  match api_path + '/core_workflows/perform',    to: 'cw#perform',  via: :post
end
