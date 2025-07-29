Rails.application.routes.draw do
  root "my/photos#index"
  resource :session
end
