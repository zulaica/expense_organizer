# require('spec_helper')
#
# describe(Budget) do
#
#   describe(".all") do
#     it("gives a list of all budgets") do
#       expect(Budget.all()).to(eq([]))
#     end
#   end
#
#   describe('#save') do
#     it("saves a budget to the database") do
#       expense = Expense.new({:id => nil, :description => "Cheeseburgers", :amount => 350.00, :date_purchased => "2015-01-22"})
#       expense.save()
#       category = Category.new({:id => nil, :name => "Work"})
#       category.save()
#       budget = Budget.new({:id => nil, :expense_id => expense.id(), :category_id => category.id()})
#       budget.save()
#       expect(Budget.all()).to(eq([budget]))
#     end
#   end
#
#   describe('#==') do
#     it("makes sure initialized arguments are equal if they share a name") do
#       budget1 = Budget.new({:id => nil, :expense_id => 1, :category_id => 1})
#       budget1.save()
#       budget2 = Budget.new({:id => nil, :expense_id => 1, :category_id => 1})
#       budget2.save()
#       expect(budget1).to(eq(budget2))
#     end
#   end
# end
