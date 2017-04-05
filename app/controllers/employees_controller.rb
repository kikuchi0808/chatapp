# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_departments
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_employees, only: [:index, :by_position, :by_grade]
  before_action :set_department, only: [:index, :by_position, :by_grade]

  def index
    @employees = @employees.order(:code).page(params[:page]).per(36)
  end

  def by_position
    @position_names = Position.order(:id).pluck(:name)
  end

  def by_grade
    @employee_salary_grades = EmployeeSalaryGrade.includes(:salary_grade, employee: :department)
                                                 .where(month: Time.zone.now.to_s(:year_month),
                                                        employee: @employees)
  end

  def show; end

  def new
    @employee = Employee.new
    @employee.careers.build
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = '登録が完了しました。'
      redirect_to employees_path
    else
      flash[:alert] = '入力にエラーがあります。'
      render :new
    end
  end

  def edit
    @employee.careers.build
  end

  def update
    employee_update_transaction
    flash[:notice] = '編集が完了しました。'
    redirect_to employee_path
  rescue
    flash[:alert] = '入力にエラーがあります。'
    render :edit
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_departments
    @departments = Department.all
  end

  def set_employees
    @employees = Employee.by_name(params[:by_name])
    return @employees = @employees.includes(:department) if params[:department_id].blank?
    @employees = @employees
                 .where(department: child_departments_of(params[:department_id] || params[:id]))
                 .includes(:department)
  end

  def set_department
    @department = Department.find_by(id: params[:department_id])
  end

  def employee_update_transaction
    EmployeeSalaryGrade.transaction do
      @employee.current_employee_salary_grade.destroy if @employee.current_salary_grade.present?
      @employee.update!(employee_params)
    end
  end

  def employee_params
    return base_employee_params if salary_grade.blank?
    base_employee_params.merge(employee_salary_grades_attributes: [{
                                 salary_grade: salary_grade,
                                 month: Time.zone.now.to_s(:year_month)
                               }])
  end

  def base_employee_params
    params.require(:employee)
          .permit(:code, :name, :kana_name, :gender, :join_date, :birth_date, :employment_type_id,
                  :department_id, :position_id, :location_id, :join_classification, :retire_date,
                  :career, :school_career, :school_career_classification, :reward_punishment,
                  :assessment, :salary_grade, :image, :role, :school_department,
                  careers_attributes: [:name, :id])
  end

  def salary_grade
    SalaryGrade.find_by(grade: params[:grade], grade_class: params[:grade_class])
  end

  def child_departments_of(department_id)
    Department.find(department_id).self_and_descendants
  end
end
