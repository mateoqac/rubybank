Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :transactions

  devise_scope :user do
    authenticated :user do
      root 'bank_accounts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  match '/transfer'   => 'bank_accounts#transfer',   :as => :bank_account_transfer,  :via => [:get]
end
