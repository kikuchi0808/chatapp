# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'talkers#index'
  resources :talkers
  resources :rooms

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions'}
end
