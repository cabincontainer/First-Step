Cabincontainer::Application.routes.draw do
  resources :homes, only: [:index]
  resource :user_session, only: [:new, :create, :destroy]
  resource :password_reset, only: [:new, :create, :edit, :update]
  resources :manage_categories, only: [:index, :new, :create, :edit, :update, :show]
  resources :manage_products, only: [:index, :new, :create, :edit, :update, :show]
  root to: "homes#index"
end
