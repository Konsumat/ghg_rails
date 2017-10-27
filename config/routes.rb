Rails.application.routes.draw do
  root 'em_annus#index'
  resources :em_annus
end
