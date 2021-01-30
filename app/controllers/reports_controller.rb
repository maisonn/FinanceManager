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
    # query expenses for a date range
    expenses = Expense.where(date: @start_date..@end_date)
    # load the categories and put them in a hash where the category id is the key
    categories_by_id = Category.where(id: expenses.map(&:category_id).uniq).index_by(&:id)

    # build the expected data structure, collect the expenses by category id
    my_data = expenses.group_by(&:category_id).each_with_object([]) do |(category_id, expenses), array|
      #collect the category expenses by day and count them
      counts_by_day = expenses.group_by_day { |expense| expense.date.to_date }.transform_values{ |expenses| expenses.sum(&:amount) }
      array << { name: categories_by_id[category_id].name, data: counts_by_day} # data structure
    end
  end

  def mydatamy
    # query incomes for a date range
    incomes = Income.where(date: @start_date..@end_date)
    # load the categories and put them in a hash where the category id is the key
    categories_by_id = Category.where(id: incomes.map(&:category_id).uniq).index_by(&:id)

    # build the expected data structure, collect the incomes by category id
    my_data = incomes.group_by(&:category_id).each_with_object([]) do |(category_id, incomes), array|
      #collect the category incomes by day and count them
      counts_by_day = incomes.group_by_day { |expense| expense.date.to_date }.transform_values{ |incomes| incomes.sum(&:amount) }
      array << { name: categories_by_id[category_id].name, data: counts_by_day} # data structure
    end
  end
end