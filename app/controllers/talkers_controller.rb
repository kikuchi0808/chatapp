# frozen_string_literal: true

class TalkersController < ApplicationController
  def index
    @talkers = Talker.all
  end
end
