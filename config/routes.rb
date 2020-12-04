Rails.application.routes.draw do
  root 'to_dos#index'
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :to_dos
    end
  end
end
