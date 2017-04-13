# frozen_string_literal: true

class RoomsController < ApplicationController
  def index; end

  def show
    @room = Room.find(params[:id])
    @messages = Message.where(room_id: params[:id])
  end

  def new
    @room = Room.new
    5.times {@room.talker_rooms.build}
  end

  def create
    if @room = Room.create(room_params)
      render :index
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    # @room.talker_rooms.build
  end

  def update
    if @room = Room.update(room_params)
      render :show
    else
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, talker_rooms_attributes: [:talker_id, :id])
  end
end
