BestVimrc::Application.routes.draw do
  root :to => 'vimrcs#index'

  match '/auth/:provider/callback', :to => 'sessions#callback'
  match '/auth/failure', :to => "sessions#error"
  match '/signout', :to => "sessions#destroy"

  resources :vimrcs
end
