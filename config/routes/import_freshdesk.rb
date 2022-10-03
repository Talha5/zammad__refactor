Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  # import freshdesk
  match api_path + '/import/freshdesk/url_check',          to: 'i_freshdesk#url_check',         via: :post
  match api_path + '/import/freshdesk/credentials_check',  to: 'i_freshdesk#credentials_check', via: :post
  match api_path + '/import/freshdesk/import_start',       to: 'i_freshdesk#import_start',      via: :post
  match api_path + '/import/freshdesk/import_status',      to: 'i_freshdesk#import_status',     via: :get

end
