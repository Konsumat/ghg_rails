Rails.application.routes.draw do
  root 'em_annu_pools_kps#index'
  resources :em_annu_kps
  resources :em_annu_lulucfs
  resources :em_annu_ghg_kps
  resources :em_annu_ghg_lulucfs
  resources :em_annu_pools_kps
  resources :em_annu_pools_lulucfs
  resources :em_ttt_kps
  resources :em_ttt_lulucfs
  resources :em_ttt_ghg_kps
  resources :em_ttt_ghg_lulucfs
  resources :em_ttt_pools_kps
  resources :em_ttt_pools_lulucfs
end
