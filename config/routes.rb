Rails.application.routes.draw do


  get 'informations/resource'
  devise_for :owners

  devise_scope :owner do
    get '/owners/sign_out' => 'devise/sessions#destroy'
  end

  root to: "informations#index"
  resources :informations
end
