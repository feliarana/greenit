Rails.application.routes.draw do
  root 'admin/dashboard#index'
  devise_for :users, ActiveAdmin::Devise.config

  scope ':locale', defaults: { locale: I18n.locale } do
    ActiveAdmin.routes(self)
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/webhooks/telegram_21822723036742551749625844092942067206' => 'webhook#callback'
end
