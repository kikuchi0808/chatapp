# frozen_string_literal: true

# rubocop:disable Metrics/LineLength

class ApplicationController < ActionController::Base
  before_action :set_rooms

  private

  def set_rooms
    @rooms = Room.all
  end
end
