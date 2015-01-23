class Category

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category|
      id = category.fetch("id").to_i
      name = category.fetch("name")
      categories.push(Category.new({:id => id, :name => name}))
    end
    categories
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:add_expense) do |expense|
    result = DB.exec("INSERT INTO categories_expenses (category_id, expense_id) VALUES (#{self.id()}, #{expense.id()});")
  end

  define_method(:total_expenses) do
    total_expenses = []
    results = DB.exec(
    "SELECT expenses.* FROM categories
      JOIN categories_expenses ON (categories.id = categories_expenses.category_id)
      JOIN expenses ON (categories_expenses.expense_id = expenses.id)
      WHERE categories.id = #{self.id()};"
    )
    results.each() do |result|
      id = result.first().fetch("id").to_i()
      description = result.first().fetch("description")
      amount = result.first().fetch("amount").to_f()
      date_purchased = result.first().fetch("date_purchased")
      expense = Expense.new({:id => id, :description => description, :amount => amount, :date_purchased => date_purchased})
      total_expenses.push(expense)
    end
    # total_expenses.push(results)
    total_expenses
  end

  define_method(:==) do |other|
    same_id = self.id().eql?(other.id())
    same_name = self.name().eql?(other.name())
    same_name
  end

end

# result = DB.exec("INSERT INTO expenses (description, amount, date_purchased) VALUES ('#{@description}', #{@amount}, '#{@date_purchased}') RETURNING id;")


# SELECT cities.* FROM
# friends JOIN cities_friends ON (friends.id = cities_friends.friend_id)
# JOIN cities ON (cities_friends.city_id = city.id)
# WHERE friends.id = 1;
