# frozen_string_literal: true

class TalkersController < ApplicationController
  def index
    @talkers = Talker.all
  end

  def show
    @talker = Talker.find(params[:id])
  end

end
