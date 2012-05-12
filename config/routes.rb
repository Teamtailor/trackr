Trackr::Application.routes.draw do
  post '/reports' => 'reports#create'
  get  '/reports/:domain' => 'reports#show', domain: /.*/, format: false
  root to: 'signups#index'
end
