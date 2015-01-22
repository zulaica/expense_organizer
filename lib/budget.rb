class Budget

  attr_reader(:id, :expense_id, :category_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @expense_id = attributes.fetch(:expense_id)
    @category_id = attributes.fetch(:category_id)
  end

  define_singleton_method(:all) do
    returned_budgets = DB.exec("SELECT * FROM budgets;")
    budgets =[]
    returned_budgets.each() do |budget|
      id = budget.fetch("id").to_i()
      expense_id = budget.fetch("expense_id").to_i()
      category_id = budget.fetch("category_id").to_i()
      budgets.push(Budget.new({:id => id, :expense_id => expense_id, :category_id => category_id}))
    end
    budgets
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO budgets (expense_id, category_id) VALUES (#{@expense_id}, #{@category_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |other|
    same_id = self.id().eql?(other.id())
    same_expense_id = self.expense_id().eql?(other.expense_id())
    same_category_id = self.category_id().eql?(other.category_id())
    same_expense_id.&(same_category_id)
  end

end
