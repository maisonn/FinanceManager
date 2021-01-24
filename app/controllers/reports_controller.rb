class ReportsController < ApplicationController

  def index
    @expenses = Expense.all
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_path
    else
      render 'reports/index'
    end
  end

  private

  def report_params
    params.permit(:start_date, :end_date)
  end
end