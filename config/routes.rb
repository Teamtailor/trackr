Trackr::Application.routes.draw do
  resources :reports, :only => [:show]
  root :to => 'signups#index'
end
