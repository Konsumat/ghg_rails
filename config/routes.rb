Rails.application.routes.draw do
  root 'em_annus#index'
  resources :em_annus
  resources :em_annu_ghg_kps
  resources :em_annu_pools_kps
end
