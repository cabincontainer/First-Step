Cabincontainer::Application.routes.draw do
  resources :homes, only: [:index]
  resource :user_session, only: [:new, :create, :destroy]
  resource :password_reset, only: [:new, :create, :edit, :update]
  root to: "homes#index"
end
