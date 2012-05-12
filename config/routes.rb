Trackr::Application.routes.draw do
  resources :reports, only: [:create, :show], id: /[^\/]+/, format: false do
    get 'history' => 'reports#history', as: :history
  end
  root to: 'signups#index'
end
