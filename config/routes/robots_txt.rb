Zammad::Application.routes.draw do
  match '/robots.txt', to: 'robots_txt#index', via: :get
end
