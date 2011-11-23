BestVimrc::Application.routes.draw do
  root :to => 'vimrcs#index'

  resources :vimrcs
end
