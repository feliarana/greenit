Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/webhooks/telegram_21822723036742551749625844092942067206' => 'webhook#callback'
end
