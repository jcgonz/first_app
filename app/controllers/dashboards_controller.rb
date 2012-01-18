class DashboardsController < ApplicationController

  def index
    @business_lines = BusinessLine.all
    @expenses_to_show = Expense.all
  end

end