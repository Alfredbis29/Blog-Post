Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :destroy, :edit, :update] do
      member do
        post :like
      end
    end
  end
end
