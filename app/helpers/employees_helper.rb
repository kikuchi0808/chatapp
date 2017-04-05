# frozen_string_literal: true

module EmployeesHelper
  def service_years(employee)
    (employee.service_days / 30.4375).floor.divmod(12)
  end
end
