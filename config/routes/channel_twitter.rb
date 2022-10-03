Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/channels_twitter',           to: 'c_twitter#index',            via: :get
  match api_path + '/channels_twitter/:id',       to: 'c_twitter#update',           via: :post
  match api_path + '/channels_twitter_disable',   to: 'c_twitter#disable',          via: :post
  match api_path + '/channels_twitter_enable',    to: 'c_twitter#enable',           via: :post
  match api_path + '/channels_twitter',           to: 'c_twitter#destroy',          via: :delete
  match api_path + '/channels_twitter_webhook',   to: 'c_twitter#webhook_verify',   via: :get
  match api_path + '/channels_twitter_webhook',   to: 'c_twitter#webhook_incoming', via: :post

end
