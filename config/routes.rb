Trackr::Application.routes.draw do
  resources :reports, :only => [:create, :show], :format => false
  root :to => 'signups#index'
end
