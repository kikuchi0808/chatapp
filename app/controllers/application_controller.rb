# frozen_string_literal: true

# rubocop:disable Metrics/LineLength

class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'staging', password: 'ahCh5fie3o' if ENV['PROTECT_WITH_BASIC_AUTH']

  protect_from_forgery with: :exception
end
