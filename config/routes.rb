Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles do
    resources :comments do
      put 'up_vote' => 'comments#up_vote'
      put 'down_vote' => 'comments#down_vote'
    end
  end
  resources :tags
  
  resources :authors
  
  resources :author_sessions, only: [ :new, :create, :destroy ]
  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
  get 'register' => 'authors#new'
  
end
