Trackr::Application.routes.draw do
  resources :reports, only: [:create, :show], id: /[^\/]+/, format: false
  root to: 'signups#index'
end
