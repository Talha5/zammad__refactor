Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/channels_email',                 to: 'c_email#index',         via: :get
  match api_path + '/channels_email_probe',           to: 'c_email#probe',         via: :post
  match api_path + '/channels_email_outbound',        to: 'c_email#outbound',      via: :post
  match api_path + '/channels_email_inbound',         to: 'c_email#inbound',       via: :post
  match api_path + '/channels_email_verify',          to: 'c_email#verify',        via: :post
  match api_path + '/channels_email_notification',    to: 'c_email#notification',  via: :post
  match api_path + '/channels_email_disable',         to: 'c_email#disable',       via: :post
  match api_path + '/channels_email_enable',          to: 'c_email#enable',        via: :post
  match api_path + '/channels_email',                 to: 'c_email#destroy',       via: :delete
  match api_path + '/channels_email_group/:id',       to: 'c_email#group',         via: :post

end
