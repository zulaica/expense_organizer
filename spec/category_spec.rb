require('spec_helper')

describe(Category) do

  describe(".all") do
    it("gives a list of all categories") do
      expect(Category.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a category to the database") do
      category = Category.new({:id => nil, :name => "Work"})
      category.save()
      expect(Category.all()).to(eq([category]))
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
