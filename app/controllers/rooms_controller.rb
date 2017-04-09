# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @room = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @talker_rooms = TalkerRoom.where(room_id: params[:id])
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
    @room.talker_rooms.build
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
