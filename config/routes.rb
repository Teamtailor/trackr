Trackr::Application.routes.draw do
  resources :reports, :only => [:create, :show]
  root :to => 'signups#index'
end
