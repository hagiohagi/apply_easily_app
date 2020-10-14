Rails.application.routes.draw do
  devise_for :owners
  resource :users
root to: "users#index"


end
