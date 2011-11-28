Rails.application.routes.draw do
  mount ElVfs::Engine => '/el_vfs'
  resources :entries
  root :to => 'home#index'
end
