Rails.application.routes.draw do
  root to: 'freights#index'

  resources :freights

  post 'calcular_frete', to: 'freights#calcular_frete'
end
