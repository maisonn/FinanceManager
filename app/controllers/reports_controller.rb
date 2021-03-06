class ReportsController < ApplicationController
  before_action :authenticate_user!
  def index
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    #For Expenses
    @hash_var = keytransformexpense

    #Charts
    @expense_pie_chart_data = @hash_var.each_with_object({}) { |(k, v), hash| hash[k.name] = v }
    @expense_line_chart_data = datamydata
    @expense_line_chart_data_by_week = datamydatabyweek
    @expense_line_chart_data_by_month = datamydatabymonth
    @expense_line_chart_data_by_year = datamydatabyyear
    @series_e = @hash_var.map { |k, v| { name: k.name, data: [v.to_f] } }.to_json
    
    #Total Sum
    @total = current_user.expenses.where(date: @start_date..@end_date).sum(:amount)


    #For Incomes
    @hashi_var = keytransformincome

    #Charts
    @income_pie_chart_data = @hashi_var.each_with_object({}) { |(k, v), hash| hash[k.name] = v }
    @income_line_chart_data = mydatamy
    @income_line_chart_data_by_week = mydatamybyweek
    @income_line_chart_data_by_month = mydatamybymonth
    @income_line_chart_data_by_year = mydatamybyyear
    @series_i = @hashi_var.map { |k, v| { name: k.name, data: [v.to_f] } }.to_json

    #Total Sum
    @totali = current_user.incomes.where(date: @start_date..@end_date).sum(:amount)
  end

  def keytransformexpense
    hash = current_user.expenses.where(date: @start_date..@end_date).group(:category_id).sum(:amount)

    categories_by_id = current_user.categories.where(id: hash.keys).index_by(&:id)

    hash.transform_keys { |key| categories_by_id[key] }
  end

  def keytransformincome
    hash = current_user.incomes.where(date: @start_date..@end_date).group(:category_id).sum(:amount)

    categories_by_id = current_user.categories.where(id: hash.keys).index_by(&:id)

    hash.transform_keys { |key| categories_by_id[key] }
  end
  
  def datamydata
    data = current_user.expenses.where(date: @start_date..@end_date).group(:category_id).group_by_day(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def datamydatabyweek
    data = current_user.expenses.where(date: @start_date..@end_date).group(:category_id).group_by_week(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def datamydatabymonth
    data = current_user.expenses.where(date: @start_date..@end_date).group(:category_id).group_by_month(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def datamydatabyyear
    data = current_user.expenses.where(date: @start_date..@end_date).group(:category_id).group_by_year(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def mydatamy
    data = current_user.incomes.where(date: @start_date..@end_date).group(:category_id).group_by_day(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def mydatamybyweek
    data = current_user.incomes.where(date: @start_date..@end_date).group(:category_id).group_by_week(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def mydatamybymonth
    data = current_user.incomes.where(date: @start_date..@end_date).group(:category_id).group_by_month(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def mydatamybyyear
    data = current_user.incomes.where(date: @start_date..@end_date).group(:category_id).group_by_year(:date).sum(:amount)
    categories_by_id = current_user.categories.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end
end