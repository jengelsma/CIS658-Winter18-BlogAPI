Rails.application.routes.draw do
  resources :authors do
    resources :posts
  end
end
