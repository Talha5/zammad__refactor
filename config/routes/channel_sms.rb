Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/channels_sms',                 to: 'c_sms#index',         via: :get
  match api_path + '/channels_sms/:id',             to: 'c_sms#show',          via: :get
  match api_path + '/channels_sms',                 to: 'c_sms#create',        via: :post
  match api_path + '/channels_sms/:id',             to: 'c_sms#update',        via: :put
  match api_path + '/channels_sms/:id',             to: 'c_sms#destroy',       via: :delete
  match api_path + '/channels_sms_enable',          to: 'c_sms#enable',        via: :post
  match api_path + '/channels_sms_disable',         to: 'c_sms#disable',       via: :post
  match api_path + '/channels_sms',                 to: 'c_sms#destroy',       via: :delete
  match api_path + '/channels_sms/test',            to: 'c_sms#test',          via: :post
  match api_path + '/sms_webhook/:token',           to: 'c_sms#webhook',       via: :get
  match api_path + '/sms_webhook/:token',           to: 'c_sms#webhook',       via: :post

end
