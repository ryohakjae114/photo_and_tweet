Rails.application.routes.draw do
  root 'my/photos#index'
  namespace :my do
    resources :photos, only: %i[new create]
  end
  resource :session, only: %i[show new edit create update destroy]
end
