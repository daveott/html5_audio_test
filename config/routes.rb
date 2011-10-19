Html5AudioTest::Application.routes.draw do
  resources :mp3s, only: :index
  root :to => 'dashboard#show'
end
