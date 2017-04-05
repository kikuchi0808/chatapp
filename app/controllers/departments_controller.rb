# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_action :set_department, only: [:edit, :update, :destroy]

  def index
    @departments = Department.order(:lft).all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path, flash: { notice: '部門の登録が完了しました。' }
    else
      render :new, flash: { alert: '部門の登録に失敗しました。' }
    end
  end

  def edit; end

  def update
    if @department.update(department_params)
      redirect_to departments_path, flash: { notice: '部門の編集が完了しました。' }
    else
      render :edit, flash: { alert: '部門の編集に失敗しました。' }
    end
  end

  def destroy
    if @department.employees.any?
      redirect_to departments_path, flash: { alert: '部門の削除に失敗しました。' }
    else
      @department.destroy
      redirect_to departments_path, flash: { notice: '部門の削除が完了しました。' }
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :parent_id)
  end

  def set_department
    @department = Department.find(params[:id] || params[:department_id])
  end
end
