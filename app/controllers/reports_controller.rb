class ReportsController < ApplicationController

  def index
    @expenses = Expense.all
  end

  



end