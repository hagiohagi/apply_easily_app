Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :owners

  resource :infomations do
    ccollection do
      get 'step1'
      get 'step2'
      get 'step3' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end

    root to: "informations#index"
  end


end
