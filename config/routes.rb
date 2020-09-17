Rails.application.routes.draw do
  get 'communities/new'
  post 'communities/create'
  post '/callback' => 'linebot#callback'
  root to: 'top#index'
end
