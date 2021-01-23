class Api::ReportsController < Api::BaseController
    def create
        respond_to do |format|
          format.js
        end
    end

    def format_dates
        @start_date = params[:start_date].nil? || params[:start_date].empty? ?
            1.month.ago.midnight :
            params[:start_date].to_datetime.midnight
        @end_date = params[:end_date].nil? || params[:end_date].empty? ?
            Time.current.at_end_of_day :
            params[:end_date].to_datetime.at_end_of_day
        @start_date, @end_date = @end_date, @start_date if @end_date < @start_date
    end
    
    def by_day
        pie_chart Expense.where(date: @start_date..@end_date).group(:category).sum(:amount), prefix: "$", title: "Expenses Report For Period:"
        line_chart Expense.where(date: @start_date..@end_date).group(:category).group_by_day(:date).sum(:amount), prefix: "$", title: "Expenses Report For Period:"
    end
end