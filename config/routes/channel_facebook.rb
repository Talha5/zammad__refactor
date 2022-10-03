Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/channels_facebook',            to: 'c_facebook#index',    via: :get
  match api_path + '/channels_facebook/:id',        to: 'c_facebook#update',   via: :post
  match api_path + '/channels_facebook_disable',    to: 'c_facebook#disable',  via: :post
  match api_path + '/channels_facebook_enable',     to: 'c_facebook#enable',   via: :post
  match api_path + '/channels_facebook',            to: 'c_facebook#destroy',  via: :delete
end
