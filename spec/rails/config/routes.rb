Rails.application.routes.draw do
  devise_jwt_for :users
end
