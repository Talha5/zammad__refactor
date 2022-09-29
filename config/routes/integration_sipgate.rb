Zammad::Application.routes.draw do

  match '/api/v1/sipgate/:token/in/',     to: 'integration/sipgate#event',    via: :post
  match '/api/v1/sipgate/:token/out/',    to: 'integration/sipgate#event',   via: :post

end
