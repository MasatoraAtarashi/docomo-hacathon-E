Rails.application.routes.draw do
  get 'communities/new'
  get 'communities/create'
  post '/callback' => 'linebot#callback'
  root to: 'top#index'
end
