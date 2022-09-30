Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  # import kayako
  match api_path + '/import/kayako/url_check',          to: 'i_kayako#url_check',         via: :post
  match api_path + '/import/kayako/credentials_check',  to: 'i_kayako#credentials_check', via: :post
  match api_path + '/import/kayako/import_start',       to: 'i_kayako#import_start',      via: :post
  match api_path + '/import/kayako/import_status',      to: 'i_kayako#import_status',     via: :get

end
