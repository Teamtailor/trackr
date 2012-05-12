Trackr::Application.routes.draw do
  resources :reports, only: [:create, :show], id: /[^\/]+/, format: false do
    get 'history' => 'reports#history', as: :history
    get 'top_urls' => 'reports#top_urls', as: :top_urls
  end
  root to: 'signups#index'
end
