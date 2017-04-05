# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'talker#index'
  resources :talkers
end
