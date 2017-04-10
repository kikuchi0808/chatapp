# frozen_string_literal: true

class TalkersController < ApplicationController
  def index
    @talkers = Talker.all
  end

  def show
    @talker = Talker.find(params[:id])
  end

  def new
    @talker = Talker.new
  end

  def create
    if @talker = Talker.create(talker_params)
      render :index
    else
      render :new
    end
  end

  private

  def talker_params
    params.require(:talker).permit(:name, :username).merge(user_id: current_user.id)
  end
end
