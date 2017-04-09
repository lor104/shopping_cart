require './stuff.rb'

class ShoppingCart

  attr_reader :cart

  def initialize
    @cart = []
  end

  def add(name, base_price, tax_rate, quantity)
    quantity.times do
      @cart << Stuff.new(name, base_price, tax_rate)
    end
    return @cart
  end

  def remove(name)
    @cart.delete_if {name == @cart.name}
  end

  def total_cost
    total = 0
    @cart.each do |product|
      total += product.base_price
    end
    return total
  end

  def total_cost_with_tax
    total = 0
    @cart.each do |product|
      price = product.base_price * (1 + product.tax_rate)
      total += price
    end
    return total
  end

end


# from stuff.rb
# def initialize(name, base_price, tax_rate)
#   @name = name
#   @base_price = base_price
#   @tax_rate = tax_rate
# end

#tests:
c = ShoppingCart.new
c.add("banana", 4, 0.13, 2)
c.add("tomato", 3, 0.15, 6)
c.add("celery", 5, 0.7, 1)
c.add("mushroom", 8, 0.13, 2)
puts c.cart.inspect
puts "Total cost of your cart without tax is: #{c.total_cost}"
#should return -- $47
puts "Total cost of your cart with tax is: #{c.total_cost_with_tax}"
#should return -- 9.04 + 20.7 + 5.35 + 18.08 = $53.169999999999995

a = ShoppingCart.new
a.add("jeans", 56, 0.13, 1)
a.add("tshirt", 18, 0.15, 2)
a.add("coat", 115, 0.15, 1)
a.add("socks", 7, 0.13, 6)
puts a.cart.inspect
puts "Total cost of your cart without tax is: #{a.total_cost}"
#should return -- $249
puts "Total cost of your cart with tax is: #{a.total_cost_with_tax}"
#should return -- 63.28 + 41.4 + 132.25 + 47.46 = $284.39
