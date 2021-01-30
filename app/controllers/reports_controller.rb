class ReportsController < ApplicationController
  def index
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    #For Expenses
    @hash_var = keytransformexpense

    #Charts
    @expense_pie_chart_data = @hash_var.each_with_object({}) { |(k, v), hash| hash[k.name] = v }
    @expense_line_chart_data = datamydata
    
    #Total Sum
    @total = Expense.where(date: @start_date..@end_date).sum(:amount)


    #For Incomes
    @hashi_var = keytransformincome

    #Charts
    @income_pie_chart_data = @hashi_var.each_with_object({}) { |(k, v), hash| hash[k.name] = v }
    @income_line_chart_data = mydatamy

    #Total Sum
    @totali = Income.where(date: @start_date..@end_date).sum(:amount)
  end

  def keytransformexpense
    hash = Expense.where(date: @start_date..@end_date).group(:category_id).sum(:amount)

    categories_by_id = Category.where(id: hash.keys).index_by(&:id)

    hash.transform_keys { |key| categories_by_id[key] }
  end

  def keytransformincome
    hash = Income.where(date: @start_date..@end_date).group(:category_id).sum(:amount)

    categories_by_id = Category.where(id: hash.keys).index_by(&:id)

    hash.transform_keys { |key| categories_by_id[key] }
  end
  
  def datamydata
    data = Expense.where(date: @start_date..@end_date).group(:category_id).group_by_day(:date).sum(:amount)
    categories_by_id = Category.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end

  def mydatamy
    data = Income.where(date: @start_date..@end_date).group(:category_id).group_by_day(:date).sum(:amount)
    categories_by_id = Category.all.index_by(&:id)
    data.transform_keys { |key| [categories_by_id[key[0]].name, key[1]] }
  end
end