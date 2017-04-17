Rails.application.routes.draw do
  get 'links/index'

  root to: "links#index"

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
      get "hottest_links", to: "hottest_links#index"
    end
  end
end
