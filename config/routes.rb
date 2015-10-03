Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config

  mount Videoteca::API => '/v1'
  
  root :to => redirect('/admin')
end
