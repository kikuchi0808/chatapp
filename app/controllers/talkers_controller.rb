# frozen_string_literal: true

class TalkersController < ApplicationController
  def index
    @talkers = Talker.all
  end

  def show
    @talker = Talker.find(current_user.talker.id)
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

  def edit
    @talker = Talker.find(current_user.talker.id)
  end

  def update
    if @talker = Talker.update(talker_params)
      render :index
    else
      render :new
    end
  end

  private

  def talker_params
    params.require(:talker).permit(:name, :username, :hobby, :note, :occupation).merge(user_id: current_user.id)
  end
end
