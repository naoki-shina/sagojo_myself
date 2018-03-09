Rails.application.routes.draw do

# devise用
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/registrations/show', to: 'users/registrations#show'
  end

# メール登録確認用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

# 利用規約用
  get 'users/privacy_policy', to: 'users#privacy_policy'
  get 'users/terms_of_service', to: 'users#terms_of_service'

# index
  root 'articles#index'
  get 'home',          to: 'header#home'
  get 'home/job',      to: 'header#job'
  get 'home/job/:id',  to: 'header#show', as: 'home_job_detail'
  get 'home/triplab',  to: 'header#triplab'
  get 'home/newcomer', to: 'header#newcomer'
  get 'home/company',  to: 'header#company'
  get 'home/FAQ',      to: 'header#faq'
end
