Trackr::Application.routes.draw do
  resources :reports, :only => [:index]
  root :to => 'signups#index'
end
