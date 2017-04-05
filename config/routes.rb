# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'talkers#index'
  resources :talkers
end
