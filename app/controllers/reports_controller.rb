class ReportsController < ApplicationController


  def index
    @expenses = Expense.all
    @incomes = Income.all
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end



end