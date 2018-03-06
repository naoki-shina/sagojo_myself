Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/registrations/show', to: 'users/registrations#show'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'articles#index'
  
  # 仮ルーティング作成
  resource :articles, only: [:index, :show]
  get 'articles/privacy_policy', to: 'articles#privacy_policy'
  
  get 'work/recommend', to: 'articles#work_recommend'
end
