Rails.application.routes.draw do
  root 'my/photos#index'
  namespace :my do
    resources :photos, only: %i[new create]
  end
  namespace :oauth do
    get :authorize, to: 'authorize'
    get :callback, to: 'callback'
  end
  resource :session, only: %i[show new edit create update destroy]
end
