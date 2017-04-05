# frozen_string_literal: true

module ApplicationHelper
  def link_to_sign_out
    link_to t('defaults.sign_out'), destroy_user_session_path, method: :delete
  end

  def employees_in_the_selected_position(employees, position)
    employees.where(position: Position.where(name: position))
  end

  def employees_in_the_selected_grade(employee_salary_grades, grade)
    employee_salary_grades.where(salary_grade: SalaryGrade.where(grade: grade))
  end
end
