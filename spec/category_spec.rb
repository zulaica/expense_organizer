require('spec_helper')

describe(Category) do

  describe(".all") do
    it("gives a list of all categories") do
      expect(Category.all()).to(eq([]))
    end
  end

  # describe(".percentage") do
  #   it("gives the percentage spent per category") do
  #     expense1 = Expense.new({:id => nil, :description => "Hamburgers", :amount => 250.00, :date_purchased => "2015-01-21"})
  #     expense1.save()
  #     expense2 = Expense.new({:id => nil, :description => "Cheeseburgers", :amount => 750.00, :date_purchased => "2015-01-22"})
  #     expense2.save()
  #     category1 = Category.new({:id => nil, :name => "Work"})
  #     category1.save()
  #     category2 = Category.new({:id => nil, :name => "Turnt Up"})
  #     category2.save()
  #     expect(Category.percentage()).to(eq([25,75]))
  #   end
  # end

  describe('#save') do
    it("saves a category to the database") do
      category = Category.new({:id => nil, :name => "Work"})
      category.save()
      expect(Category.all()).to(eq([category]))
    end
  end

  describe("#add_expense") do
    it("associates an expense to a category") do
      expense = Expense.new({:id => nil, :description => "Cheeseburgers", :amount => 5.00, :date_purchased => "2015-01-22"})
      expense.save()
      category = Category.new({:id => nil, :name => "Work"})
      category.save()
      category.add_expense(expense)
# binding.pry
      expect(category.total_expenses()).to(eq([expense]))
    end
  end

  describe('#==') do
    it("makes sure initialized arguments are equal if they share a name") do
      category1 = Category.new({:id => nil, :name => "Work"})
      category1.save()
      category2 = Category.new({:id => nil, :name => "Work"})
      category2.save()
      expect(category1).to(eq(category2))
    end
  end
end
