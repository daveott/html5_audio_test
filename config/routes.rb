Html5AudioTest::Application.routes.draw do
  resources :mp3s, except: [:edit, :update]
  root :to => 'dashboard#show'
end
