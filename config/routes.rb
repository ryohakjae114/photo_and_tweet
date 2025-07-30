Rails.application.routes.draw do
  root 'my/photos#index'
  resource :session, only: %i[show new edit create update destroy]
end
