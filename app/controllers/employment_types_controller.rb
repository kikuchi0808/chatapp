# frozen_string_literal: true

class EmploymentTypesController < ApplicationController
  before_action :set_departments
  before_action :set_employment_type, only: [:edit, :update, :destroy]

  def index
    @employment_types = EmploymentType.all
    @controller_name = :employment_types
  end

  def new
    @employment_type = EmploymentType.new
  end

  def create
    @employment_type = EmploymentType.new(employment_type_params)
    if @employment_type.save
      redirect_to employment_types_path, flash: { notice: '雇用形態の登録が完了しました。' }
    else
      render :new, flash: { alert: '雇用形態の登録に失敗しました。' }
    end
  end

  def edit; end

  def update
    if @employment_type.update(employment_type_params)
      redirect_to employment_types_path, flash: { notice: '雇用形態の編集が完了しました。' }
    else
      render :edit, flash: { alert: '雇用形態の編集に失敗しました。' }
    end
  end

  def destroy
    if @employment_type.employees.any?
      redirect_to employment_types_path, flash: { alert: '雇用形態の削除に失敗しました。' }
    else
      @employment_type.destroy
      redirect_to employment_types_path, flash: { notice: '雇用形態の削除が完了しました。' }
    end
  end

  private

  def set_departments
    @departments = NestedTreeBuilder.from_ar(Department.all)
  end

  def set_employment_type
    @employment_type = EmploymentType.find(params[:id])
  end

  def employment_type_params
    params.require(:employment_type).permit(:name)
  end
end
