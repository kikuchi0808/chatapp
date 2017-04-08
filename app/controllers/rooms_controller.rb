# frozen_string_literal: true

class RoomsController < ApplicationController
  def show
    @room = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.update(room_params)
  end
end
