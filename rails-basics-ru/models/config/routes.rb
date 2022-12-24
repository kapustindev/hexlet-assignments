# frozen_string_literal: true

Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  root 'home#index'
  # BEGIN
  resources :articles
  # END
end
