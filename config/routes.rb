Rails.application.routes.draw do
  # User Authentication
  devise_for :users

  # Main Resources
  resources :assignments
  resources :students
  resources :contacts, only: [ :create ]

  # Static Pages
  get "faq", to: "static_pages#faq"
  get "about", to: "static_pages#about"
  root "static_pages#home"

  # Admin Routes
  namespace :admin do
    patch "users/:id", to: "admin#update_user", as: :update_user
  end
  get "admin/dashboard", to: "admin#dashboard", as: :dashboard
  get "admin/view_messages", to: "admin#view_messages", as: :view_messages

  # User Management
  resources :users, only: [ :index, :edit, :update, :show, :destroy ] do
    member do
      patch :change_role
    end
  end

  # Health Check and PWA
  get "up", to: "rails/health#show", as: :rails_health_check
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end
