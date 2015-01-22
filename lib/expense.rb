class Expense

  attr_reader(:id, :description, :amount, :date_purchased)

  define_method(:initialize) do |attributes|
    @id = nil
    @description = attributes.fetch(:description)
    @amount = attributes.fetch(:amount)
    @date_purchased = attributes.fetch(:date_purchased)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expense.fetch("id").to_i()
      description = expense.fetch("description")
      amount = expense.fetch("amount").to_i()
      date_purchased = expense.fetch("date_purchased")
      expenses.push(Expense.new({:id => id, :description => description, :amount => amount, :date_purchased => date_purchased}))
    end
    expenses
  end

  define_method(:==) do |other|
    same_id = self.id().eql?(other.id())
    same_description = self.description().eql?(other.description())
    same_amount = self.amount().eql?(other.amount())
    same_date_purchased = self.date_purchased().eql?(other.date_purchased())
  end

end
