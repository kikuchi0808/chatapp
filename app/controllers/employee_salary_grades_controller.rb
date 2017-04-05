# frozen_string_literal: true

class EmployeeSalaryGradesController < ApplicationController
  before_action :set_employees, only: [:new, :create, :destroy]

  def new
    if @employees.present?
      @action = :by_grade
      @department = Department.find(params[:department_id])
    else
      flash[:alert] = '該当する部門に属する従業員が登録されていません。'
      redirect_to employees_by_grade_path
    end
  end

  def create
    EmployeeSalaryGrade.transaction do
      @destroy_grades = EmployeeSalaryGrade.where(month: Time.zone.now.to_s(:year_month),
                                                  employee: @employees)
      @destroy_grades.destroy_all
      EmployeeSalaryGrade.bulk_insert(grade_params)
    end
    flash[:notice] = '登録が完了しました。'
    redirect_to employees_by_grade_path
  rescue
    flash[:alert] = '登録を完了できませんでした。'
    render :new
  end

  private

  def set_employees
    @employees = Employee.where(department: find_department_children_of(params[:department_id]))
                         .includes(:department)
  end

  def find_department_children_of(department_id)
    Department.find(department_id).self_and_descendants
  end

  def grade_params
    params.permit(:department_id, salary_grade: [:grade, :grade_class, :employee_id])
  end
end
