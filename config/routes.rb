Html5AudioTest::Application.routes.draw do
  resources :mp3s, except: :edit
  resources :playlists, only: [:index, :show]
  match "/playlists/download", to: "playlists#download"
  root :to => 'mp3s#index'
end
