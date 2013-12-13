MusicApp::Application.routes.draw do
  resources :users, :only => [:index, :create, :show, :new]
  resource :session, :except => [:edit]
end
