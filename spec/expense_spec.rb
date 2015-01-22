require('spec_helper')

describe(Expense) do

  describe(".all") do
    it("gives a list of all expenses") do
      expect(Expense.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an expense to the database") do
      expense = Expense.new({:id => nil, :description => "Cheeseburgers", :amount => 350.00, :date_purchased => "2015-01-22"})
      expense.save()
      expect(Expense.all()).to(eq([expense]))
    end
  end

  describe('#==') do
    it("makes sure initialized arguments are equal if they share a name") do
      expense1 = Expense.new({:id => nil, :description => "Cheeseburgers", :amount => 350.00, :date_purchased => "2015-01-22"})
      expense2 = Expense.new({:id => nil, :description => "Cheeseburgers", :amount => 350.00, :date_purchased => "2015-01-22"})
      expect(expense1).to(eq(expense2))
    end
  end



end
