Zammad::Application.routes.draw do
  api_path = Rails.configuration.api_path

  # import zendesk
  match api_path + '/import/zendesk/url_check',          to: 'i_zendesk#url_check',         via: :post
  match api_path + '/import/zendesk/credentials_check',  to: 'i_zendesk#credentials_check', via: :post
  match api_path + '/import/zendesk/import_start',       to: 'i_zendesk#import_start',      via: :post
  match api_path + '/import/zendesk/import_status',      to: 'i_zendesk#import_status',     via: :get

end
