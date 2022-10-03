Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/channels_telegram',                         to: 'c_telegram#index',    via: :get
  match api_path + '/channels_telegram',                         to: 'c_telegram#add',      via: :post
  match api_path + '/channels_telegram/:id',                     to: 'c_telegram#update',   via: :put
  match api_path + '/channels_telegram_webhook/:callback_token', to: 'c_telegram#webhook',  via: :post
  match api_path + '/channels_telegram_disable',                 to: 'c_telegram#disable',  via: :post
  match api_path + '/channels_telegram_enable',                  to: 'c_telegram#enable',   via: :post
  match api_path + '/channels_telegram',                         to: 'c_telegram#destroy',  via: :delete

end
