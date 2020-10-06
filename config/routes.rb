Rails.application.routes.draw do
  devise_for :admins
  get 'users/index'
root to: "users#index"

end
