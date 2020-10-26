Rails.application.routes.draw do

  resource :informations do
    collection do
      get 'step1'
      get 'step2'
      get 'step3' # ここで、入力の全てが終了する
      post 'confirm' # 確認用ページ
      get 'done' # 登録完了後のページ
    end

  end
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  } 

    resources :parttimes, only: [:new, :create, :show, :delete] do
      collection do
        post 'confirm'
        get 'done'
      end
    end


  devise_for :owners

  root to: 'informations#index'

end
